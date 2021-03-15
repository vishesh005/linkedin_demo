import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleButton extends StatelessWidget {
  final String text;

  const GoogleButton({
    Key key,
    this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  side: BorderSide(
                      color: Theme
                          .of(context)
                          .primaryColor)))),
      onPressed: () {},
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center
          , children: [
          SvgPicture.asset(
            "resource/images/g_logo.svg",
            height: 20,
          ),
          SizedBox(width: 10,),
          Text(text)
        ],
        ),
      ),
    );
  }
}


class OrDivider extends StatelessWidget {
  const OrDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
            flex: 1,
            child: Divider(color: Colors.black, thickness: 0.3)),
        SizedBox(width: 20,),
        Text(" OR "),
        SizedBox(width: 20,),
        Flexible(
            flex: 1,
            child: Divider(color: Colors.black, thickness: 0.3))
      ],
    );
  }
}




class EmailPasswordForm extends StatefulWidget {

  bool showPasswordField;

  bool showPasswordHint;

  String hintMessage;

  String passwordValMessage;

  String emailOrPhoneValMessage;

  final GlobalKey<FormState> formKey;

  EmailPasswordForm({
    this.showPasswordField = true,
    this.showPasswordHint = false,
    this.hintMessage,
    this.emailOrPhoneValMessage = "Email address or phone is not valid",
    this.passwordValMessage = "Please enter a password with at least 6 characters",
    @required this.formKey
  });


  @override
  _EmailPasswordFormState createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> with SingleTickerProviderStateMixin{

   AnimationController _controller;
   Animation<double> _expansion;
   Animation<Offset> _slide;

   @override
  void initState() {
      _controller = AnimationController(value: widget.showPasswordField ? 1.0 : 0.0,vsync: this , duration: Duration(seconds: 1));
      _expansion = CurvedAnimation(parent: _controller , curve: Curves.easeOut);
      _slide = Tween(begin: const Offset(1.5,0.0), end: Offset.zero ).animate(CurvedAnimation(parent: _controller, curve:Curves.easeOut));
      super.initState();
  }

  _EmailPasswordFormState();
  bool showPassword= false;


  @override
  Widget build(BuildContext context) {
    if(widget.showPasswordField) _controller.forward();
    else _controller.reverse();
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
              decoration: InputDecoration(
                labelText: "Email or Phone",
              ),
            validator: (value) => EmailValidator.validate(value) || value.isValidPhoneNo() ?
                null : widget.emailOrPhoneValMessage
            ),
           AnimatedBuilder(
             animation: _controller,
             builder: (context, snapshot) {
               return SizeTransition(
                 sizeFactor: _expansion ,
                child: SlideTransition(
                   position: _slide,
                   child: Column(
                     children: [
                       TextFormField(
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: Icon(
                                    showPassword ? Icons.remove_red_eye_outlined : Icons.remove_red_eye
                                ),
                              ),
                            ),
                            obscureText: !showPassword,
                            validator: (value) => !widget.showPasswordField ? null :
                            (value.length >= 6 ? null : widget.passwordValMessage)
                            ,
                          ),
                        Visibility(
                          visible: widget.showPasswordHint,
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.topLeft
                              ,child: Text(widget?.hintMessage ?? "")),
                        )
                     ],
                   ),
                 ));
             }
           ),

        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
extension on String{
  bool isValidPhoneNo() => this.length  == 10 && int.tryParse(this) != null;


}
