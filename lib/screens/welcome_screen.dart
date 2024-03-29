import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flutter/animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/classes/Rounded_Button.dart';
class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      upperBound: 1,
      vsync: this,
    );

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
  }
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
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset('images/logo.png'),
                  height: 60.0,
                ),
                TypewriterAnimatedTextKit(
                 text : ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,

                  ),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
             RoundedButton(title: 'Log In',colour: Colors.lightBlueAccent,onPressed: (){
               Navigator.pushNamed(context, LoginScreen.id);
             },),
            RoundedButton(title: 'Register',colour: Colors.lightBlueAccent,onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },)
          ],
        ),
      ),
    );
  }
}


