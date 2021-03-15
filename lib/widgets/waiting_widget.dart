import 'package:flutter/material.dart';

class WaitingWidget extends StatefulWidget {
  @override
  _WaitingWidgetState createState() => _WaitingWidgetState();
}

class _WaitingWidgetState extends State<WaitingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

