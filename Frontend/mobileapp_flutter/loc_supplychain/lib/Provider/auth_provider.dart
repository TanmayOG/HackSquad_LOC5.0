// import 'package:flutter/cupertino.dart';
// import 'package:loc_supplychain/Constant/config.dart';
// import 'package:loc_supplychain/Contract/contract_deployed.dart';
// import 'package:web3dart/credentials.dart';

// class AuthProvider extends ChangeNotifier {
//   bool _isloading = false;

//   bool get isloading => _isloading;

//   void setloading(bool value) {
//     _isloading = value;
//     notifyListeners();
//   }

//   createAccount(String address, String name, String location, String contact,
//       String email, String role, web3client) async {
//     setloading(true);
//     await Future.delayed(const Duration(seconds: 2));
//     EthereumAddress address =
//         EthereumAddress.fromHex('0x1C1362A46a50Ba121f47e205e774ABDeC90C540f');

//     addSuppler(address, name, location, contact, email, role, PrivateKeyRaw,
//         web3client);

//     setloading(false);
//   }
// }
