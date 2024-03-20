import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_exam_project/providers/user_provider.dart';
import 'package:my_exam_project/screens/home_screen.dart';
import 'package:my_exam_project/screens/on_boarding_screen.dart';
import 'package:my_exam_project/screens/registration_screen.dart';
import 'package:my_exam_project/screens/welcome.dart';
import 'package:my_exam_project/utilities/theme_data.dart';
import 'package:provider/provider.dart';

//TODO:
//TODO-3: Try to implement verifying a user email during the registration, before accessing the Home Page
//TODO-4: Try to implemt login with Apple or Google (I've tried and didn't succeed)
//TODO-2: Implment the UI (not the logic) for the Home screen -> view Image
//TODO-super: cocoapods

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          OnBoardingScreen.id: (context) => const OnBoardingScreen(),
          RegistrationScreen.id: (context) => const RegistrationScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
        },
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              //ConnectionState.active triggers -> we have to check if the user is logged
              if (snapshot.connectionState == ConnectionState.active) {
                debugPrint('dentro 1');

                //Here we check the logged user with hasData
                if (snapshot.hasData) {
                  //If we have a user -> go to the HomeScreen
                  debugPrint('dentro 2');
                  return const HomeScreen();
                }
              }

              //Any time we work with AuthState -> ConnectionState.waiting is trigger
              //But some times is too quick to show us the Loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }

              //After we tried snapshot.hasData we realize we haven't a user
              //So we call teh RegistrationScreen
              return const RegistrationScreen();
            }),
      ),
    );
  }
}
