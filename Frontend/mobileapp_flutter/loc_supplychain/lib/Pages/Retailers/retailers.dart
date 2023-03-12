import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3gdrive/Constant/config.dart';
import 'package:web3gdrive/Pages/Raw%20Material/add_raw_mat.dart';
import 'package:web3gdrive/main.dart';
import 'package:web3gdrive/services/contract_func.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Web3Client? web3Client;
  Client httpClient = Client();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    web3Client = Web3Client(infuraUrl, httpClient);
    _manufacturerAddress.text = ManuFacturerAdd;
  }

  final TextEditingController _manufacturerAddress = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AddRawMat();
                },
              ));
            },
            backgroundColor: bgDark,
            child: const Icon(Icons.add, color: Colors.white),
          ),
          appBar: AppBar(
            title: const Text(''),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // FetchRawMaterial(web3Client!);
                      log(const Uuid().v4());
                    },
                    child: const Text('Retailers 👜',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // FutureBuilder(
                  //   future: FetchRawMaterial(web3Client!),
                  //   builder: (context, AsyncSnapshot snapshot) {
                     

                  //     log('${snapshot.data}data');
                     
                  //     if (snapshot.hasError) {
                  //       log('${snapshot.error}error');
                  //       return const Center(
                  //         child: Text('No Raw Material Found'),
                  //       );
                  //     }
                  //     if (snapshot.hasData) {
                  //       log('${snapshot.data}data');
                  //       return ListView.builder(
                  //           shrinkWrap: true,
                  //           itemCount: snapshot.data.length,
                  //           itemBuilder: (context, index) {
                  //             var data = snapshot.data[index];
                  //             return Card(
                  //               color: bgDark,
                  //               child: ListTile(
                  //                 onTap: () {
                  //                   dialogBox(
                  //                       snapshot.data[index][0].toString(),
                  //                       snapshot.data[index][2],
                  //                       snapshot.data[index][3],
                  //                       snapshot.data[index][4],
                  //                       snapshot.data[index][5].toString(),
                  //                       snapshot.data[index][5].toString(),
                  //                       _manufacturerAddress,
                  //                       web3Client);
                  //                 },
                  //                 title: Text(snapshot.data[index][0]),
                  //                 subtitle: Text(snapshot.data[index][1]),
                  //               ),
                  //             );
                  //           });
                  //     } else {
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //   },
                  // )
             
             
                ],
              ),
            ),
          )),
    );
  }

  dialogBox(
      name, type, location, date, address, Id, manufacturerAddress, client) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: bg,
            title: const Text('Raw Material Details'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Material Owner Address'),
                    subtitle: Text(address),
                  ),
                  ListTile(
                    title: const Text('Material Name'),
                    subtitle: Text(name),
                  ),
                  ListTile(
                    title: const Text('Material Type'),
                    subtitle: Text(type),
                  ),
                  ListTile(
                    title: const Text('Material Location'),
                    subtitle: Text(location),
                  ),
                  ListTile(
                    title: const Text('Material Id'),
                    subtitle: Text(Id),
                  ),
                  ListTile(
                    title: const Text('Material Date'),
                    subtitle: Text(date),
                  ),
                  button(
                    () {
                      // show dailog for text field to enter address of manufacturer

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: bg,
                              title: const Text('Enter Manufacturer Address'),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: manufacturerAddress,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: bgDark, width: 2.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: bgDark, width: 2.0),
                                          ),
                                          hintText: 'Enter Address'),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    button(
                                      () async {
                                        try {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor: bgDark,
                                                  content: const Text(
                                                      'Transfered to Manufacturer',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white))));
                                        } catch (e) {
                                          log(e.toString());
                                        }

                                        // transfer material to manufacturer
                                        // transferMaterial(web3Client!,
                                        //     _manufacturerAddress.text, address);
                                      },
                                      "Transfered to Manufacturer",
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    "Transfer Material",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  button(
                    () {
                      // show dailog for text field to enter address of manufacturer

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: bg,
                              title: const Text('Enter Manufacturer Address'),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: manufacturerAddress,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: bgDark, width: 2.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: bgDark, width: 2.0),
                                          ),
                                          hintText: 'Enter Address'),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    button(
                                      () async {
                                        try {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor: bgDark,
                                                  content: const Text(
                                                      'Transfered to Manufacturer',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white))));
                                        } catch (e) {
                                          log(e.toString());
                                        }

                                        // transfer material to manufacturer
                                        // transferMaterial(web3Client!,
                                        //     _manufacturerAddress.text, address);
                                      },
                                      "History Material",
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    "History Material",
                  )
                ],
              ),
            ),
          );
        });
  }
}


// showDialogbox for details of raw material


