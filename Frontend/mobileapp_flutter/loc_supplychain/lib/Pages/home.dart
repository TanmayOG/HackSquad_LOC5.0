import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ipfs/flutter_ipfs.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';
import 'package:web3gdrive/Constant/config.dart';
import 'package:web3gdrive/main.dart';
import 'package:web3gdrive/services/contract_func.dart';

class IpfsFileUploader extends StatefulWidget {
  @override
  _IpfsFileUploaderState createState() => _IpfsFileUploaderState();
}

class _IpfsFileUploaderState extends State<IpfsFileUploader> {
  final ipfs = FlutterIpfs();

  _uploadFileToIPFS() async {
    Web3Client ethClient = Web3Client(infuraUrl, http.Client());
    final filePicker = FilePickerService.pickFile(context).then((value) async {
      if (value != null) {
        log(value.toString());
        setState(() {
          cid1 = value.toString();
        });

        String url = 'https://ipfs.io/ipfs/${value.toString()}';

        await add(url, PatientAddress, ethClient, paitent_private_key);
      }
    });
  }

  dis() async {
    Web3Client ethClient = Web3Client(infuraUrl, http.Client());
    await getImage(PatientAddress, ethClient).then((value) {
      log(value.toString());
    });
  }

  accessL() async {
    Web3Client ethClient = Web3Client(infuraUrl, http.Client());
    await access(PatientAddress, ethClient, paitent_private_key).then((value) {
      log(value.toString());
    });
  }

  String? _contentType;

  Future<void> _fetchUrl() async {
    try {
      final response = await http.get(Uri.parse(
          'https://ipfs.io/ipfs/bafybeibj2uq276oxpmkrh52phdf7umqotc3zthy66ryxo325kydgbg6byi'));
      setState(() {
        _contentType = response.headers['content-type'];
      });
      log('${_contentType}content type');
    } catch (error) {
      print('Error fetching URL: $error');
    }
  }

  String cid1 = 'bafybeihx4wsyjpk6uk4345r5hzph5mzs2nilcr77aeaycnjbpsuowshoge';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: ListTile(
          // leading: CircleAvatar(
          //   backgroundColor: Colors.white,
          //   child: Icon(Icons.cloud, color: bg),
          // ),
          title: const Text('Blockchain',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  locale: Locale('fr', 'FR'))),
          trailing: CircleAvatar(
            backgroundColor: bg,
            child: const Icon(Icons.cloud, color: Colors.black),
          ),
          subtitle: GestureDetector(
              onTap: () {
                // _uploadFileToIPFS();
                // newSuppler();
              },
              child: const Text('Cloud Storage')),
        )),
        body: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 3,
              child: Tile(index: 0),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2.5,
              child: Tile(index: 1),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2.2,
              child: Tile(index: 2),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2.4,
              child: Tile(index: 3),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2.8,
              child: Tile(index: 4),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 3,
              child: Tile(index: 4),
            ),
          ],
        )
        //  Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       // ElevatedButton(
        //       //   onPressed: dis,
        //       //   child: const Text('Display File'),
        //       // ),
        //       // ElevatedButton(
        //       //   onPressed: _uploadFileToIPFS,
        //       //   child: const Text('Upload File'),
        //       // ),
        //       // const SizedBox(height: 16),
        //       // Text('IPFS Hash: $cid1'),
        //       // const SizedBox(height: 16),
        //       // Image.network(
        //       //   'https://gateway.ipfs.io/ipfs/$cid1',
        //       //   headers: const {'accept': 'image/*'},
        //       //   height: 200,
        //       //   width: 200,
        //       //   // color: Colors.blue,
        //       // ),

        //       // // if image is showing Exception: Invalid image data then it is pdf file and we need to use below code

        //       // const Icon(
        //       //   Icons.picture_as_pdf,
        //       //   size: 200,
        //       //   color: Colors.blue,
        //       // ),
        //       // Expanded(
        //       //   child: SizedBox(
        //       //     height: 200,
        //       //     width: 200,
        //       //     child: StaggeredGridView.countBuilder(
        //       //       crossAxisCount: 4,
        //       //       shrinkWrap: true,
        //       //       itemCount: images.length,
        //       //       itemBuilder: (BuildContext context, int index) => Card(
        //       //         child: Column(
        //       //           children: <Widget>[
        //       //             Image.network(images[index]),
        //       //             const Text("Some text"),
        //       //           ],
        //       //         ),
        //       //       ),
        //       //       staggeredTileBuilder: (int index) =>
        //       //           const StaggeredTile.fit(2),
        //       //       mainAxisSpacing: 4.0,
        //       //       crossAxisSpacing: 4.0,
        //       //     ),
        //       //   ),
        //       // ),

        //     ],
        //   ),
        // ),
        );
  }
}

Tile({required int index}) {
  return Card(
    color: Colors.blue,
    child: Center(
      child: Text(
        'Tile $index',
        style: const TextStyle(fontSize: 24),
      ),
    ),
  );
}

class BackGroundTile extends StatelessWidget {
  final Color? backgroundColor;
  final IconData? icondata;

  const BackGroundTile({this.backgroundColor, this.icondata});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Icon(icondata, color: Colors.white),
    );
  }
}
