import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ipfs/flutter_ipfs.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3gdrive/Constant/config.dart';
import 'package:web3gdrive/Pages/jsontoIPFS.dart';
import 'package:web3gdrive/main.dart';
import 'package:web3gdrive/services/contract_func.dart';

class CreateNft extends StatefulWidget {
  const CreateNft({super.key});

  @override
  State<CreateNft> createState() => _CreateNftState();
}

class _CreateNftState extends State<CreateNft> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _MatrialIdController = TextEditingController();
  final TextEditingController _ManufacturerIdController =
      TextEditingController();
  final TextEditingController _dateofManufController = TextEditingController();
  final TextEditingController _qualityContoller = TextEditingController();

  Web3Client? web3Client;
  Client httpClient = Client();

  _uploadFileToIPFS() async {
    Web3Client ethClient = Web3Client(infuraUrl, Client());
    final filePicker = FilePickerService.pickFile(context).then((value) async {
      if (value != null) {
        log(value.toString());
        setState(() {
          cid = value.toString();
        });

        String url = 'https://ipfs.io/ipfs/${value.toString()}';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    web3Client = Web3Client(infuraUrl, httpClient);
  }

  String? cid;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Create NFT',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                        'Please enter the following details to create NFT',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    _textField(
                        'Name', _nameController, 'Enter name of the Material'),
                    const SizedBox(
                      height: 20,
                    ),
                    _textField(
                        'Description', _desc, 'Enter Description of Product'),
                    const SizedBox(
                      height: 20,
                    ),
                    _textField('Material Id', _MatrialIdController,
                        'Enter Material Id of Product'),
                    const SizedBox(
                      height: 20,
                    ),

                    // _textField(
                    //     'Description', _desc, 'Enter Description of Product'),
                    ListTile(
                      onTap: () {
                        _uploadFileToIPFS();
                      },
                      title: Text(cid == null ? 'Upload Image' : "Image Hash"),
                      trailing: const Icon(Icons.upload_file),
                      subtitle: Text(cid == null ? '' : cid!),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // ListTile(
                    //   title: const Text("Material Id"),
                    //   trailing: const Icon(Icons.upload_file),
                    //   subtitle: DropdownButton<String>(
                    //     value: _MatrialIdController.text,
                    //     underline: Container(
                    //       height: 2,
                    //       color: Colors.deepPurpleAccent,
                    //     ),
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         _MatrialIdController.text = newValue!;
                    //       });
                    //     },
                    //     items: <String>[]
                    //         .map<DropdownMenuItem<String>>((String value) {
                    //       return DropdownMenuItem<String>(
                    //         value: value,
                    //         child: Text(value),
                    //       );
                    //     }).toList(),
                    //   ),
                    // ),
                    // _textField(
                    //     'Origin', _locationController, 'Origin of the Material',
                    //     isPhone: false),
                    const SizedBox(
                      height: 20,
                    ),
                    // _textField('Home Address', _homeAdressController,
                    //     'Enter your home address'),
                    // _textField('Private Key', _privateContoller,
                    //     'Enter your private key'),
                    const SizedBox(
                      height: 40,
                    ),
                    button(() async {
                      // ListOfGoods(web3Client);
                      try {
                        if (_formKey.currentState!.validate()) {
                          // verifyPhone();
                          // ListOfGoods(web3Client);

                          setState(() {
                            isLoading = true;
                          });

                          // create an Json object

                          var nftData = {
                            "name": _nameController.text,
                            "description": _desc.text,
                            "image": 'https://ipfs.io/ipfs/$cid',
                            "attributes": [
                              {
                                "trait_type": "Material Id",
                                "value": _MatrialIdController.text
                              },
                              {
                                "trait_type": "Manufacturer Id",
                                "value": ManuFacturerAdd
                              },
                              {
                                "trait_type": "Date of Manufacture",
                                "value": DateTime.now().toString()
                              },
                              // {
                              //   "trait_type": "Quality",
                              //   "value": _qualityContoller.text
                              // },
                            ]
                          };

                          // create String Json object

                          var nftDataString = json.encode(nftData);
                          await uploadJsonToIpfs(nftDataString).then((value) {
                            print(value);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: bgDark,
                                content: const Text('NFT Created',
                                    style: TextStyle(color: Colors.white))));

                            AddRawMaterial(
                              RawMaterilaAddress,
                              'https://ipfs.io/ipfs/$value',
                            );
                          });

                          // uploadJSONtoIPFS(nftData).then((value) {
                          //   print(value);
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       backgroundColor: bgDark,
                          //       content: const Text('NFT Created',
                          //           style: TextStyle(color: Colors.white))));
                          // });

                          // PinataService().pinJSONToIPFS(nftData).then((value) {
                          //   print(value);
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       backgroundColor: bgDark,
                          //       content: const Text('NFT Created',
                          //           style: TextStyle(color: Colors.white))));
                          // });

                          setState(() {
                            isLoading = false;
                          });
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     backgroundColor: bgDark,
                          //     content: const Text(
                          //         'Raw Material Into Blockchain',
                          //         style: TextStyle(color: Colors.white))));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: bgDark,
                              content: const Text('Please fill all the fields',
                                  style: TextStyle(color: Colors.white))));
                        }
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        print(e);
                      }
                    }, 'Continue', isLoading: isLoading),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Future<String> uploadJSONtoIPFS(Map<String, dynamic> jsonData) async {
    final url = Uri.parse('https://ipfs.infura.io:5001/api/v0/add');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(jsonData),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['Hash'];
    } else {
      throw Exception('Failed to upload JSON to IPFS');
    }
  }
}

Widget _textField(name, controller, hint,
    {bool isPhone = false, bool isPassword = false}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      name,
    ),
    subtitle: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill this box';
          }
          return null;
        },
        maxLength: isPhone ? 10 : null,
        obscureText: isPassword ? true : false,
        controller: controller,
        cursorColor: bgDark,
        keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          counter: const Offstage(),
          prefixText: isPhone ? '+91 ' : '',
          border: const OutlineInputBorder(),
          enabled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          hintText: hint,
        ),
      ),
    ),
  );
}

Widget button(OnTap, text, {bool isLoading = false}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: bgDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onPressed: OnTap,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              text.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
    ),
  );
}
