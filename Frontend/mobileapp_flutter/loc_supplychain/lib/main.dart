import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3gdrive/Constant/config.dart';
import 'package:web3gdrive/Pages/Distrubuter/distrubuter.dart';
import 'package:web3gdrive/Pages/Manufacturer/manufacturer.dart';
import 'package:web3gdrive/Pages/Raw%20Material/raw_material.dart';
import 'package:web3gdrive/Pages/Retailers/retailers.dart';

void main() {
  runApp(const MyApp());
}

Color bg = const Color(0xff332946);
Color bgDark = const Color.fromARGB(255, 21, 17, 28);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: bg,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Web3Client web3Client = Web3Client(infuraUrl, Client());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 5), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      // if (await CheckNewOrOld(PatientAddress, web3Client) == false) {
      //   log('new user');
      //   Navigator.pushReplacement(context,
      //       MaterialPageRoute(builder: (context) => const LoginPage()));
      // } else if (await isSuppler(PatientAddress, web3Client) == false) {
      //   log('old user');
      //   Navigator.pushReplacement(context,
      //       MaterialPageRoute(builder: (context) => const WaitingPage()));
      // } else if (await isSuppler(PatientAddress, web3Client) == true &&
      //     await CheckNewOrOld(PatientAddress, web3Client) == true) {
      //   log('HomePage');
      //   Navigator.pushReplacement(context,
      //       MaterialPageRoute(builder: (context) => IpfsFileUploader()));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Loading...'),
          SizedBox(height: 20),
          CircularProgressIndicator(),
        ],
      ),
    ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  var privateKey = '';
                  var rawMaterialPage = '';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RawMaterialPage()));
                },
                child: const Text('Raw Material')),
            ElevatedButton(
                onPressed: () {
                  var privateKey = '';
                  var manufacturer = '';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManuFacturerScreen()));
                },
                child: const Text('Manufacturer')),
            ElevatedButton(
                onPressed: () {
                  var distributor = '';
                  var privateKey = '';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DistributerScreen()));
                },
                child: const Text('Distributor')),
            ElevatedButton(
                onPressed: () {
                  var retails = '';
                  var privateKey = '';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyWidget()));
                },
                child: const Text('Retailer')),
          ],
        ),
      ),
    );
  }
}
