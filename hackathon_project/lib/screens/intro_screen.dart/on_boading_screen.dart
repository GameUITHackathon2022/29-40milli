import 'package:flutter/material.dart';
import 'package:hackathon_project/screens/main_screen/MainScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_screen1.dart';
import 'intro_screen2.dart';
import 'intro_screen3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
// controller to keep track of which page we're on
  PageController _controller = PageController();
// keep track of if we are on the last page or not
  bool _onLastPage = false;

  void backToPageOneOfOnBoarding() {
    _controller.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xff61C5A0),
                      fontSize: 18,
                    ),
                  ),
                ),

                // dot indicators
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const JumpingDotEffect(
                    activeDotColor: Color(0xff61C5A0),
                    dotColor: Color(0xffD7EDE3),
                  ),
                ),

                // next or done
                _onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                              /* HomePage(
                                backToPageOneOfOnBoarding:
                                    backToPageOneOfOnBoarding,
                              ) */
                            ),
                          );
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            color: Color(0xff61C5A0),
                            fontSize: 18,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Color(0xff61C5A0),
                            fontSize: 18,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
