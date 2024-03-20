import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_exam_project/resources/auth_methods.dart';
import 'package:my_exam_project/utilities/size_config.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String _email;
  late String _password;
  late String _newPassword;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double heigh = SizeConfig.screenH!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: heigh * 0.83,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 100.0,
                        backgroundColor:
                            const Color.fromARGB(255, 162, 186, 228),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/images/sammy-registration.png',
                            height: 190,
                          ),
                        )),
                    const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'REGISTRAZONE',
                            style: TextStyle(
                                fontSize: 37, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Crea un account',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Conferma la password',
                        ),
                        onChanged: (value) {
                          _newPassword = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    FilledButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        if (_password == _newPassword) {
                          try {
                            await AuthMethods()
                                .signUpUser(email: _email, password: _password);
                          } on FirebaseAuthException catch (e) {
                            debugPrint(e.code);
                          }
                        }
                      },
                      child: _isLoading
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(3.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const Text('REGISTRATI'),
                    ),
                    const Center(
                        child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('o continua con'),
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                elevation: 10.0,
                                backgroundColor:
                                    const Color.fromARGB(255, 9, 14, 17),
                                padding: const EdgeInsets.all(18.0),
                                fixedSize: Size.fromHeight(heigh * 0.1),
                              ),
                              child: Image.asset('assets/images/google.png'),
                            ),
                          ),
                          const SizedBox(width: 40.0),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                elevation: 10.0,
                                backgroundColor:
                                    const Color.fromARGB(255, 9, 14, 17),
                                padding: const EdgeInsets.all(18.0),
                                fixedSize: Size.fromHeight(heigh * 0.1),
                              ),
                              child: Image.asset('assets/images/apple.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
