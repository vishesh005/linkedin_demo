import 'package:flutter/material.dart';
import 'package:linkedin_clone/preferences.dart';

class Auth extends ChangeNotifier{

  static final tokenKey= "_token__";
  static final userIdKey ="_userId__";
  static final expiryDateKey= "_expiryDate__";

  String tokenId;
  String userId;
  DateTime expiryDate;

  Future<void> init() async {
    await Preferences.awake();
    autoLogin();
  }

  get isUserAuthenticated => tokenId != null && tokenId.isNotEmpty;


  /// Checking if user is already logged in
  /// if user is already logged in then parsing date & time else expire session now
  void autoLogin() {
    try {
      final isUserLoggedIn = Preferences.containKey(userIdKey);
      if (isUserLoggedIn) {
        tokenId = Preferences.getString(tokenKey);
        userId = Preferences.getString(userIdKey);
        expiryDate = DateTime.parse(Preferences.getString(expiryDateKey));
      }
    }catch(e){
       expiryDate = DateTime.now();
    }
  }

}