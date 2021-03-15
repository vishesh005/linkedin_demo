import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone/screens/login_screen.dart';
import 'package:linkedin_clone/widgets/customs.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPasswordField = false;
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset("resource/images/linkedin.svg",
                      height: 30)),
              SizedBox(
                height: 35,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Join LinkedIn",
                  style:
                      theme.textTheme.headline1.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  child: RichText(
                    text: TextSpan(style: theme.textTheme.subtitle1, children: [
                      TextSpan(text: "or "),
                      TextSpan(
                          text: "sign in",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: theme.primaryColor))
                    ]),
                  ),
                  onPressed: () {
                    Navigator.restorablePushNamed(
                        context, LoginScreen.routeName);
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              EmailPasswordForm(
                showPasswordField: showPasswordField,
                showPasswordHint: true,
                formKey: key,
                hintMessage: "6 or more characters",
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final isValid = key.currentState.validate();
                  if(isValid){
                    setState(() {
                       showPasswordField = !showPasswordField;
                    });
                  }
                },
                child: SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Continue"),
                    )),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(theme.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              OrDivider(),
              SizedBox(
                height: 30,
              ),
              GoogleButton(
                text: "Continue with Google",
              )
            ],
          ),
        ),
      ),
    );
  }
}
