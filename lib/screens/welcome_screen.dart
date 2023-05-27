import 'package:chart_app/screens/registration_screen.dart';
import 'package:chart_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chart_app/components/round_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//We provide a SinTicker provider when using one Animation...
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //Initializing of the Animation Controller First..
  AnimationController? controller;
  Animation? animation;

  @override
  //InitState is run whenever the WelcomeScreen is created...
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller!);
    controller?.forward();
    controller?.addListener(() {
      setState(() {});
      print(animation?.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Faiz Chart',
                        textStyle: const TextStyle(
                          fontSize: 45.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ))
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            welcomeScreenButton(
              mycolor: Colors.lightBlueAccent,
              label: 'Login',
              nextPage: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            welcomeScreenButton(
              mycolor: Colors.blueAccent,
              label: 'Register',
              nextPage: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
