import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3gdrive/Constant/config.dart';

Future<DeployedContract> getContract() async {
  String abi = await rootBundle.loadString("assets/abi.json");
  String contractAdd = contract_Address;
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'Upload'),
      EthereumAddress.fromHex(contractAdd));
  return contract;
}

Future<String> callFunction(String functionName, List<dynamic> args,
    Web3Client ethClient, String privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await getContract();
  final ethFunction = contract.function(functionName);
  final result = await ethClient.sendTransaction(
    credentials,
    Transaction.callContract(
      contract: contract,
      function: ethFunction,
      parameters: args,
    ),
    fetchChainIdFromNetworkId: true,
    chainId: null,
  );
  return result;
}

// add func take user address and string url

Future<String> add(
    String url, String address, Web3Client ethClient, String privateKey) async {
  List<dynamic> args = [EthereumAddress.fromHex(address), url];
  String result = await callFunction(addFunc, args, ethClient, privateKey);
  log(result);
  return result;
}

// allow func take user address

Future<String> allow(
    String address, Web3Client ethClient, String privateKey) async {
  List<dynamic> args = [EthereumAddress.fromHex(address)];
  String result = await callFunction(allowFunc, args, ethClient, privateKey);
  return result;
}

// disallow func take user address

Future<String> disallow(
    String address, Web3Client ethClient, String privateKey) async {
  List<dynamic> args = [EthereumAddress.fromHex(address)];
  String result = await callFunction(disallowFunc, args, ethClient, privateKey);
  log(result);
  return result;
}

// display func take user address

// Future<String> display(
//     String address, Web3Client ethClient, String privateKey) async {
//   List<dynamic> args = [EthereumAddress.fromHex(address)];
//   var result = await callFunction(displayFunc, args, ethClient, privateKey);

//   log("result is $result");
//   return result;
// }

// display function
// function display(address _user) public view returns (string[] memory){
// require(_user==msg.sender||ownership[_user][msg.sender], "You don't have access to this data");
//     return value[msg.sender];
// }

// 0xeb39113f0000000000000000000000001c1362a46a50ba121f47e205e774abdec90c540f

getImage(String address, Web3Client ethClient) async {
  DeployedContract contract = await getContract();
  List<dynamic> args = [EthereumAddress.fromHex(address)];
  final ethFunction = contract.function(displayFunc);
  var result = await ethClient.call(
    contract: contract,
    function: ethFunction,
    params: args,
  );
  log(result.toString());
  return result;
}

// accessList func take user address

access(String address, Web3Client ethClient, String privateKey) async {
  DeployedContract contract = await getContract();
  List<dynamic> args = [EthereumAddress.fromHex(address)];
  final ethFunc = contract.function(accessList);
  var result = await ethClient.call(
    contract: contract,
    function: ethFunc,
    params: args,
  );
  log(result.toString());
  return result;
}

newSuppler() async {
  var name = "Tanmay";
  var location = "Mira Road";
  var contact = "1234567890";
  var email = "gmail";
  var role = "Supplier";

  EthereumAddress address = EthereumAddress.fromHex(PatientAddress);

  var credentials = EthPrivateKey.fromHex(paitent_private_key);

  var client = Web3Client(infuraUrl, Client());

  var contract = await getContract();

  var ethFunction = contract.function("AddSuppler");

  var result = await client.sendTransaction(
    credentials,
    Transaction.callContract(
      contract: contract,
      function: ethFunction,
      parameters: [address, name, location, contact, email, role],
    ),
    fetchChainIdFromNetworkId: true,
    chainId: null,
  );

  print(result);
}

CheckNewOrOld(String address, web3client) async {
  log("isSuppler");
  DeployedContract contract = await getContract();
  log(contract.address.toString());
  final ethFunction = contract.function("isSuppler");
  log(ethFunction.name);
  List<dynamic> result = await web3client.call(
    contract: contract,
    function: ethFunction,
    params: [EthereumAddress.fromHex(address)],
  );
  log(result[0].toString());
  return result[0];
}

isSuppler(String address, web3Client) async {
  DeployedContract contract = await getContract();
  final ethFunction = contract.function("CheckisVerified");
  List<dynamic> result = await web3Client.call(
    contract: contract,
    function: ethFunction,
    params: [EthereumAddress.fromHex(address)],
  );
  log(result[0].toString());
  return result[0];
}

AddRawMaterial(nameOfMaterial, typesOfMat, Origin, ethClient) async {
  DeployedContract contract = await getContract();
  List<dynamic> args = [
    nameOfMaterial,
    const Uuid().v4(),
    typesOfMat,
    Origin,
    DateTime.now().toString(),
    EthereumAddress.fromHex(PatientAddress)
  ];
  String result =
      await callFunction("AddMaterial", args, ethClient, paitent_private_key);
  log(result);
  return result;
}

FetchRawMaterial(ethClient) async {
  log("FetchRawMaterial");
  final agrs = [EthereumAddress.fromHex(PatientAddress)];
  DeployedContract contract = await getContract();
  final ethFunction = contract.function("GetRawMaterialByOwnerAddress");
  List<dynamic> result = await ethClient.call(
    contract: contract,
    function: ethFunction,
    params: agrs,
  );
  List list = result;
  log(list.toString());
  return list;
}

TransferToManufacture(
  String materialId,
  String manufactureAddress,
  String distributorAddress,
  Web3Client ethClient,
) async {
  DeployedContract contract = await getContract();
  List<dynamic> args = [
    EthereumAddress.fromHex(manufactureAddress),
    EthereumAddress.fromHex(distributorAddress),
    materialId,
  ];
  String result = await callFunction(
      "TransferToManuFacture", args, ethClient, paitent_private_key);
  log(result);
  return result;
}

GetAllManufactureGoods(ethClient) async {
  log("GetAllManufactureGoods");
  DeployedContract contract = await getContract();
  log("GetAllManufactureGoods");
  final ethFunction = contract.function("GetAllManufactureGoods");
  log("GetAllManufactureGoods");
  List<dynamic> result = await ethClient.call(
    contract: contract,
    function: ethFunction,
    params: [
      EthereumAddress.fromHex(ManuFacturerAdd),
    ],
  );
  log("GetAllManufactureGoods");
  List list = result[0];
  log(list.toString());

  return list;
}

ListOfGoods(ethClient) async {
  log("GetAllManufactureGoods");
  DeployedContract contract = await getContract();
  log("GetAllManufactureGoods");
  final ethFunction = contract.function("GetAllManufactureGoods");
  log("GetAllManufactureGoods");
  List<dynamic> result = await ethClient.call(
    contract: contract,
    function: ethFunction,
    params: [
      EthereumAddress.fromHex(ManuFacturerAdd),
    ],
  );
  log("GetAllManufactureGoods");
  List list = result[0];
  log(list.toString());
}
