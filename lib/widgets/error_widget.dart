import 'package:flutter/material.dart';

class ErrorsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Something went wrong !!"),
          SizedBox(height: 50),
          ElevatedButton(
            child: Text("Try Again"),
          )
        ],
      ),
    );
  }
}
