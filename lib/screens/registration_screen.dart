import 'package:flutter/material.dart';
import 'package:chart_app/components/round_button.dart';
import 'package:chart_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chart_app/screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String password;
  late String email;
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
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFeildDecoration.copyWith(hintText: 'Enter your Email'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFeildDecoration.copyWith(
                hintText: 'Enter your Password',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            roundButton(
                mycolor: Colors.lightBlueAccent,
                nextPage: () async {
                  // print(email);
                  // print(password);
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                label: 'Register')
          ],
        ),
      ),
    );
  }
}
