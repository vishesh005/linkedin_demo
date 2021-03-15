import 'package:flutter/material.dart';
import 'package:linkedin_clone/screens/login_screen.dart';
import 'package:linkedin_clone/screens/register_screen.dart';
import 'package:linkedin_clone/screens/dashboard_screen.dart';
import 'main.dart';

/// Here we are declaring routes definitions like we do in manifest for activities (android)
get routes {
  return {
    SplashScreen.routeName : (context) => SafeArea(child: SplashScreen()),

    LoginScreen.routeName : (context) => LoginScreen(),

    RegisterScreen.routeName: (context) => RegisterScreen(),

    DashboardScreen.routeName: (context) => DashboardScreen()
  };
}