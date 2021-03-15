import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone/screens/register_screen.dart';
import 'package:linkedin_clone/widgets/customs.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "resource/images/linkedin.svg",
                      height: 30,
                    ),

                    TextButton(child:
                    Text("JOIN NOW",
                        style: Theme.of(context).textTheme.headline3),
                      onPressed: (){
                        Navigator.pushNamed(context,RegisterScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child:  Text(
                    "Sign in",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Colors.black),
                  ),
              ),
              SizedBox(height: 17,),
              EmailPasswordForm(showPasswordField: true,formKey: GlobalKey<FormState>(),),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value;
                        });
                      }),
                  Text("Remember me."),
                  SizedBox(width: 12),
                  Text("Learn more",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor
                  ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                  alignment: Alignment.topLeft, child:
              Text("FORGOT PASSWORD?",
              style: TextStyle(
               color: Theme.of(context).primaryColor
              ),
              )),
              SizedBox(
                height: 20,
              ),

             ElevatedButton(
                 onPressed: () {},
                 child: Container(
                     alignment: Alignment.center,
                     width: double.infinity,
                     height: 40,
                     child: Text("CONTINUE")),
             ),

              SizedBox(height: 30,),

              OrDivider(),

              SizedBox(height: 30,),

              GoogleButton(text: "SIGN IN WITH GOOGLE")
            ],
          ),
        ),
      ),
    );
  }
}




