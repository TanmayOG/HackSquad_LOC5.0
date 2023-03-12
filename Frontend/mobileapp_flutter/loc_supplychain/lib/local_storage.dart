import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant/config.dart';

class LocalData {
  static SharedPreferences? prefs;

  static Future<void> saveData(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(key, value);
  }

  static Future<String> getData(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(key) ?? '';
  }

  static Future<void> saveBool(String key, bool value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(key) ?? false;
  }

  static Future<void> clearData() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.clear();
  }
}

class UserInfo extends ChangeNotifier {
  String? _name;
  String? _email;
  String? _phoneNo;
  String? _homeAddress;
  String? _walletAddress;

  String? get name => _name;
  String? get email => _email;
  String? get phoneNo => _phoneNo;
  String? get homeAddress => _homeAddress;
  String? get walletAddress => _walletAddress;

  set name(String? name) {
    _name = name;
    notifyListeners();
  }

  set email(String? email) {
    _email = email;
    notifyListeners();
  }

  set phoneNo(String? phoneNo) {
    _phoneNo = phoneNo;
    notifyListeners();
  }

  set homeAddress(String? homeAddress) {
    _homeAddress = homeAddress;
    notifyListeners();
  }

  set walletAddress(String? walletAddress) {
    _walletAddress = walletAddress;
    notifyListeners();
  }

  UserInfo() {
    saveData();
  }

  // LocalData localData = LocalData;

  Future<void> saveData() async {
    name = await LocalData.getData(Name);
    log('name: $name');
    email = await LocalData.getData(Email);
    phoneNo = await LocalData.getData(Phone);
    homeAddress = await LocalData.getData(Address);
    walletAddress = await LocalData.getData(WalletAddress);
  }
}
