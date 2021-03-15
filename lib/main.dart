import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone/constants.dart';
import 'package:linkedin_clone/providers/auth.dart';
import 'package:linkedin_clone/screens/dashboard_screen.dart';
import 'package:linkedin_clone/widgets/error_widget.dart';
import 'package:linkedin_clone/screens/login_screen.dart';
import 'package:linkedin_clone/preferences.dart';
import 'package:linkedin_clone/routes.dart';
import 'package:linkedin_clone/widgets/waiting_widget.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(LinkedinCloneApp());
}

class LinkedinCloneApp extends StatefulWidget {
  @override
  _LinkedinCloneAppState createState() => _LinkedinCloneAppState();
}

class _LinkedinCloneAppState extends State<LinkedinCloneApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
      ],
      child: MaterialApp(
        routes: routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Colors.blue.shade800,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            headline1: TextStyle(
              color: Colors.blue.shade800,
              fontSize: 35,
              fontWeight: FontWeight.bold,
          ),

          )
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {

  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Preferences.awake()
       ,builder: (context,snapShot) {
           if(snapShot.connectionState == ConnectionState.waiting){
              return WaitingWidget();
           }
           else if(snapShot.hasError){
             return ErrorsWidget();
           }
           else {
             return SplashWidget();
           }
       },
    );
  }
}

class SplashWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    triggerNavigate(context);
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('resource/images/logo.svg',height: 100,),
      ),
    );
  }
  triggerNavigate(BuildContext context){
    bool isLoggedIn = Preferences.getBoolean(
        IS_USER_LOGGED_IN, defaultValue: false);
    Future.delayed(Duration(seconds: 3),(){
    final screenName = isLoggedIn ?    LoginScreen.routeName : DashboardScreen.routeName;
    Navigator.pushReplacementNamed(context,screenName);
   });
  }
}

