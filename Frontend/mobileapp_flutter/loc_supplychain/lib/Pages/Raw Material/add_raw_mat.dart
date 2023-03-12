import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3gdrive/Constant/config.dart';
import 'package:web3gdrive/main.dart';
import 'package:web3gdrive/services/contract_func.dart';

class AddRawMat extends StatefulWidget {
  const AddRawMat({super.key});

  @override
  State<AddRawMat> createState() => _AddRawMatState();
}

class _AddRawMatState extends State<AddRawMat> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _addressOwnerContoller = TextEditingController();
  Web3Client? web3Client;
  Client httpClient = Client();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    web3Client = Web3Client(infuraUrl, httpClient);
    _nameController.text = '';
    _typeController.text = '';
    _locationController.text = '';
    _dateController.text = '';
    _addressOwnerContoller.text = '';
  }

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
                    const Text('Add Raw Material',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Please enter the following details',
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
                        'Type', _typeController, 'Enter type of the Material'),
                    const SizedBox(
                      height: 20,
                    ),
                    _textField(
                        'Origin', _locationController, 'Origin of the Material',
                        isPhone: false),
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
                      try {
                        if (_formKey.currentState!.validate()) {
                          // verifyPhone();
                          setState(() {
                            isLoading = true;
                          });
                          // await AddRawMaterial(
                          //     _nameController.text,
                          //     _typeController.text,
                          //     _locationController.text,
                          //     web3Client);
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: bgDark,
                              content: const Text(
                                  'Raw Material Into Blockchain',
                                  style: TextStyle(color: Colors.white))));
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
