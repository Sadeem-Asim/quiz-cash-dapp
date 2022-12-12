import 'dart:typed_data';

import 'package:erc20/erc20.dart';
import 'package:flutter/material.dart';
import 'package:quiz_cash/pages/data/repo/wallet_connector.dart';
import 'package:http/http.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_qrcode_modal_dart/walletconnect_qrcode_modal_dart.dart';
import 'package:web3dart/contracts/erc20.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class WalletConnectEthereumCredentials extends CustomTransactionSender {
  WalletConnectEthereumCredentials({required this.provider});

  final EthereumWalletConnectProvider provider;

  @override
  Future<EthereumAddress> extractAddress() {
    throw UnimplementedError();
  }

  @override
  Future<String> sendTransaction(Transaction transaction) async {
    final hash = await provider.sendTransaction(
      from: transaction.from!.hex,
      to: transaction.to?.hex,
      data: transaction.data,
      gas: transaction.maxGas,
      gasPrice: transaction.gasPrice?.getInWei,
      value: transaction.value?.getInWei,
      nonce: transaction.nonce,
    );

    return hash;
  }

  @override
  Future<MsgSignature> signToSignature(Uint8List payload,
      {int? chainId, bool isEIP1559 = false}) {
    throw UnimplementedError();
  }
}

class EthereumConnector implements WalletConnector {
  late final WalletConnectQrCodeModal _connector;
  late final EthereumWalletConnectProvider _provider;
  late final String _abiCode;
  late final String _erc20abi;
  late final EthereumAddress _contractAddress;
  late final EthereumAddress _erc20Address;
  late final DeployedContract _contract;
  late final DeployedContract _gameContract;

  late final ContractFunction _approve;
  late final ContractFunction _allowance;
  late final ContractFunction _buyGameTokens;

  // EthereumAddress _ownAddress;
  // DeployedContract _contract;

  EthereumConnector() {
    print("Helllo Man");
    init();
    _connector = WalletConnectQrCodeModal(
      connector: WalletConnect(
        bridge: 'https://bridge.walletconnect.org',
        clientMeta: const PeerMeta(
          name: 'Demo ETH',
          description: 'Demo ETH Application',
          url: 'https://walletconnect.org',
          icons: [
            'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ],
        ),
      ),
    );

    _provider = EthereumWalletConnectProvider(_connector.connector);
  }
  @override
  Future<void> init() async {
    await getAbi();
    await getDeployedContract();
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_erc20abi, "Mock"), _erc20Address);
    _approve = _contract.function("approve");
    _allowance = _contract.function("allowance");
    _gameContract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "QuizBoxReward"), _contractAddress);
    _buyGameTokens = _gameContract.function("buyGameTokens");
  }

  @override
  Future<SessionStatus?> connect(BuildContext context) async {
    return await _connector.connect(context, chainId: 97);
  }

  @override
  void registerListeners(
    OnConnectRequest? onConnect,
    OnSessionUpdate? onSessionUpdate,
    OnDisconnect? onDisconnect,
  ) =>
      _connector.registerListeners(
        onConnect: onConnect,
        onSessionUpdate: onSessionUpdate,
        onDisconnect: onDisconnect,
      );

  @override
  Future<String?> sendAmount({
    required String recipientAddress,
    required double amount,
  }) async {
    final sender =
        EthereumAddress.fromHex(_connector.connector.session.accounts[0]);
    final recipient = EthereumAddress.fromHex(address);

    final etherAmount = EtherAmount.fromUnitAndValue(
        EtherUnit.szabo, (amount * 1000 * 1000).toInt());

    final transaction = Transaction(
      to: recipient,
      from: sender,
      gasPrice: EtherAmount.inWei(BigInt.one),
      maxGas: 100000,
      value: etherAmount,
    );

    final credentials = WalletConnectEthereumCredentials(provider: _provider);
    try {
      final txBytes = await _ethereum.sendTransaction(credentials, transaction);
      return txBytes;
    } catch (e) {
      print('Error: $e');
    }

    _connector.killSession();

    return null;
  }

  @override
  Future<void> openWalletApp() async => await _connector.openWalletApp();

  @override
  Future<double> getBalance() async {
    final address =
        EthereumAddress.fromHex(_connector.connector.session.accounts[0]);
    final amount = await _ethereum.getBalance(address);
    return amount.getValueInUnit(EtherUnit.ether).toDouble();
  }

  Future<void> getAbi() async {
    String abiStringFile =
        await rootBundle.loadString("assets/quizbox_abi.json");
    _abiCode = abiStringFile;
    _contractAddress =
        EthereumAddress.fromHex("0x5a6E440e36d7C28b4F423b854979076711A54360");
    String abiFile = await rootBundle.loadString("assets/erc20.json");
    _erc20abi = abiFile;
    _erc20Address =
        EthereumAddress.fromHex("0x7CDd55F916deF259b5bbB3A77E0018AFE2Fb45f4");
  }

  @override
  Future<bool> approve() async {
    try {
      final address =
          EthereumAddress.fromHex(_connector.connector.session.accounts[0]);
      print("Done");
      final credentials = WalletConnectEthereumCredentials(provider: _provider);
      print(
        _ethereum,
      );
      if (await allowance() == false) {
        await _ethereum.sendTransaction(
            credentials,
            Transaction.callContract(
              contract: _contract,
              function: _approve,
              parameters: [
                _contractAddress,
                BigInt.parse("0xffffffffffffffff")
              ],
              from: address,
            ),
            fetchChainIdFromNetworkId: true,
            chainId: 97);
        print("Done");
        return true;
      } else {
        print("You Are Approved Already");
        await buyGameTokens();
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> allowance() async {
    final address =
        EthereumAddress.fromHex(_connector.connector.session.accounts[0]);
    print("Allowance");
    // final credentials = WalletConnectEthereumCredentials(provider: _provider);
    final mock = ERC20(
        address: EthereumAddress.fromHex(
            '0x7CDd55F916deF259b5bbB3A77E0018AFE2Fb45f4'),
        client: _ethereum,
        chainId: 97);

    final allowance = await mock.allowance(address, _contractAddress);
    print("Allowance");
    if (allowance.toInt() == 0) {
      return false;
    } else {
      true;
    }
    return true;
  }

  @override
  Future<bool> buyGameTokens() async {
    try {
      final address =
          EthereumAddress.fromHex(_connector.connector.session.accounts[0]);
      print("buyGameTokens");
      final credentials = WalletConnectEthereumCredentials(provider: _provider);

      await _ethereum.sendTransaction(
          credentials,
          Transaction.callContract(
            contract: _gameContract,
            function: _buyGameTokens,
            parameters: [BigInt.parse("1000000000000000000")],
            from: address,
          ),
          fetchChainIdFromNetworkId: true,
          chainId: 97);
      print("Done");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  bool validateAddress({required String address}) {
    try {
      EthereumAddress.fromHex(address);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  String get faucetUrl => 'https://faucet.dimensions.network/';

  @override
  String get address => _connector.connector.session.accounts[0];

  @override
  String get coinName => 'BNB';

  final _ethereum =
      Web3Client('https://data-seed-prebsc-1-s1.binance.org:8545/', Client());

  @override
  // TODO: implement connector
  get connector => throw UnimplementedError();
}
