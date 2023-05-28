import 'package:flutter/material.dart';
import 'package:chart_app/components/round_button.dart';
import 'package:chart_app/constants.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:kTextFeildDecoration.copyWith(
                hintText: 'Enter your Email',
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:kTextFeildDecoration.copyWith(
                hintText: 'Enter your Password',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            roundButton(mycolor: Colors.lightBlueAccent, nextPage: (){}, label: 'Login')
          ],
        ),
      ),
    );
  }
}
