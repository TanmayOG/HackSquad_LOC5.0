import 'dart:convert';

import 'package:http/http.dart' as http;
// import media_type.dart

class PinataService {
  static const pinataUrl = "https://api.pinata.cloud/pinning/pinFileToIPFS";
  static const pinataApiKey = "0de68675ae97af8df0e0";
  static const pinataSecretApiKey =
      "51370aa1ae79f09b67d5ba8e1732e712846de74c2579217ed86e09d6d2118be4";

  Future<String> pinJSONToIPFS(Map<String, dynamic> jsonMap) async {
    final jsonString = json.encode(jsonMap);

    final headers = {
      'Content-Type': 'application/json',
      'pinata_api_key': pinataApiKey,
      'pinata_secret_api_key': pinataSecretApiKey,
    };

    final response = await http.post(
      Uri.parse(pinataUrl),
      headers: headers,
      body: jsonString,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to upload file');
    }

    final responseJson = jsonDecode(response.body);

    return responseJson['IpfsHash'];
  }
}
