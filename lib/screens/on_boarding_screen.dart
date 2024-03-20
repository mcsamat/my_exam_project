import 'package:flutter/material.dart';
import 'package:my_exam_project/screens/registration_screen.dart';
import 'package:my_exam_project/utilities/on_boarding_contents.dart';
import 'package:my_exam_project/utilities/size_config.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id = 'OnBoardingScreen';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Colors.indigoAccent,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 10.0, top: 20.0),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            height: SizeConfig.blockV! * 45,
                          ),
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: (width <= 550) ? 35 : 27,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            contents[i].desc,
                            style: TextStyle(
                              fontSize: (width <= 550) ? 17 : 25,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(
                          index: index,
                        ),
                      ),
                    ),
                    _currentPage + 1 == contents.length
                        ? Padding(
                            padding: const EdgeInsets.all(30),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RegistrationScreen.id);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: (width <= 550)
                                    ? const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20)
                                    : EdgeInsets.symmetric(
                                        horizontal: width * 0.2, vertical: 25),
                                textStyle: TextStyle(
                                    fontSize: (width <= 550) ? 13 : 17),
                              ),
                              child: const Text("REGISTRAZIONE"),
                            ),
                          )
                        : const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
