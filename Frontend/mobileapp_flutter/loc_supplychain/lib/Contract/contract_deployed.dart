// import 'dart:developer';

// import 'package:flutter/services.dart';
// import 'package:loc_supplychain/Constant/config.dart';
// import 'package:web3dart/web3dart.dart';

// Future<DeployedContract> getContract() async {
//   String abi = await rootBundle.loadString("assets/abi.json");
//   String contractAdd = contract_Address;
//   final contract = DeployedContract(ContractAbi.fromJson(abi, 'SuppyChain'),
//       EthereumAddress.fromHex(contractAdd));
//   return contract;
// }

// Future<String> callFunction(String functionName, List<dynamic> args,
//     Web3Client ethClient, String privateKey) async {
//   EthPrivateKey credentials = EthPrivateKey.fromHex(
//       privateKey);
//   DeployedContract contract = await getContract();
//   final ethFunction = contract.function(functionName);
//   final result = await ethClient.sendTransaction(
//     credentials,
//     Transaction.callContract(
//       contract: contract,
//       function: ethFunction,
//       parameters: args,
//     ),
//     fetchChainIdFromNetworkId: true,
//     chainId: null,
//   );
//   return result;
// }

// addSuppler(
//     EthereumAddress address,
//     String name,
//     String location,
//     String contact,
//     String email,
//     String role,
//     String privateKey,
//     Web3Client web3client) async {
//   // try {
//   List<dynamic> args = [
//     address,
//     name,
//     location,
//     contact,
//     email,
//     role,
//   ];

//   DeployedContract contract = await getContract();
//   log(contract.address.toString());
//   final ethFunction = contract.function(AddSuppler);
//   log(ethFunction.name);
//   EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);

//   log(credentials.address.toString());
//   final result = await web3client.sendTransaction(
//     credentials,
//     Transaction.callContract(
//       contract: contract,
//       function: ethFunction,
//       parameters: args,
//     ),
//   );

//   log("Supplier Added $result");

//   return result;
//   // } catch (e) {
//   //   log(e.toString());
//   //   // log(e.)
//   // }
// }

// isSuppler(String address, web3client) async {
//   log("isSuppler");
//   DeployedContract contract = await getContract();
//   log(contract.address.toString());
//   final ethFunction = contract.function("CheckisVerified");
//   log(ethFunction.name);
//   List<dynamic> result = await web3client.call(
//     contract: contract,
//     function: ethFunction,
//     params: [EthereumAddress.fromHex(address)],
//   );
//   log(result.toString());
//   return result[0];
// }

// CheckNewOrOld(String address, web3Client) async {
//   DeployedContract contract = await getContract();
//   final ethFunction = contract.function("CheckisVerified");
//   List<dynamic> result = await web3Client.call(
//     contract: contract,
//     function: ethFunction,
//     params: [EthereumAddress.fromHex(address)],
//   );
//   log(result.toString());
//   return result[0];
// }

// // string memory _materialName,
// // string memory _materialId,
// // string memory _materialType,
// // string memory _materialLocation,
// // string memory _materialDate,
// // string memory _materialOwnerAddress

// // ignore: non_constant_identifier_names
// AddMaterial(
//     String materialName,
//     String materialId,
//     String materialType,
//     String materialLocation,
//     String materialDate,
//     String materialOwnerAddress,
//     String privateKey,
//     Web3Client web3client) async {
//   // try {
//   List<dynamic> args = [
//     materialName,
//     materialId,
//     materialType,
//     materialLocation,
//     materialDate,
//     materialOwnerAddress,
//   ];
//   String result =
//       await callFunction('AddMaterial', args, web3client, privateKey);

//   log("Material Added $result");
//   return result;
//   // } catch (e) {
//   //   log(e.toString());
//   //   return e.toString();
//   // }
// }

// GetRawMaterial(String materialId, Web3Client web3client) async {
//   DeployedContract contract = await getContract();
//   final ethFunction = contract.function("GetRawMaterial");
//   List<dynamic> result = await web3client.call(
//     contract: contract,
//     function: ethFunction,
//     params: [materialId],
//   );
//   log(result.toString());
//   return result;
// }

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:loc_supplychain/Constant/config.dart';
import 'package:web3dart/web3dart.dart';

Future<DeployedContract> getContract() async {
  String abi = await rootBundle.loadString("assets/abi.json");
  String contractAdd = contract_Address;
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'SuppyChain'),
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

NewSuppler() async {
  var name = "Tanmay";
  var location = "Mira Road";
  var contact = "1234567890";
  var email = "gmail";
  var role = "Supplier";
  EthereumAddress address = EthereumAddress.fromHex(PatientAddress);
  List<dynamic> args = [
    address,
    name,
    location,
    contact,
    email,
    role
  ];

  Web3Client web3client = Web3Client(infuraUrl, Client());
  DeployedContract contract = await getContract();

  final ethFunction = contract.function("AddSuppler");

  EthPrivateKey credentials = EthPrivateKey.fromHex(paitent_private_key);

  final result = await web3client.sendTransaction(
    credentials,
    Transaction.callContract(
      contract: contract,
      function: ethFunction,
      parameters: args,
    ),
  );

  print("Supplier Added $result");

  return result;
}
