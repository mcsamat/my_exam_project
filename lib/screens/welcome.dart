import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_exam_project/screens/on_boarding_screen.dart';
import 'package:my_exam_project/utilities/size_config.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    debugPrint('Siamo dentro al init di HomeScreen');
    debugPrint(_auth.currentUser.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
              child: Image.asset('assets/images/sammy-aeroplano.png'),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyWelcomeTextWidget(width: width, text: 'Ciao!'),
                  MyWelcomeTextWidget(
                      width: width, text: 'Sei nella nuova app del MGS.'),
                  MyWelcomeTextWidget(
                      width: width, text: 'Come dici?\nNon sai cosa può fare?'),
                  MyWelcomeTextWidget(
                      width: width,
                      text: 'Un sacco di cose!\nVieni, te le mostro!'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(context, OnBoardingScreen.id);
                  },
                  child: const Text(
                    'Cominciamo',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWelcomeTextWidget extends StatelessWidget {
  const MyWelcomeTextWidget({
    super.key,
    required this.width,
    required this.text,
  });

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: text == 'Ciao!'
          ? Text(
              text,
              style: TextStyle(
                fontSize: (width <= 550) ? 30 : 22,
              ),
              textAlign: TextAlign.left,
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: (width <= 550) ? 20 : 15,
              ),
              textAlign: TextAlign.left,
            ),
    );
  }
}
