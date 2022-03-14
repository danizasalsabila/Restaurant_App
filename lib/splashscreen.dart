import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);
  static const routeName = '/splashscreen_page';

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => RestaurantAppPage()));
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "images/splash2.jpg",
              width: 400.0,
              height: 300.0,
              fit: BoxFit.contain,
            ),
          ),
          SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: 100,
            appearance: CircularSliderAppearance(
              infoProperties: InfoProperties(
                  mainLabelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              )),
              customColors: CustomSliderColors(
                  dotColor: Colors.white,
                  progressBarColor: Color.fromARGB(255, 169, 169, 169),
                  shadowColor: Colors.white,
                  trackColor: Colors.white),
              spinnerDuration: 50,
              animDurationMultiplier: 2,
              animationEnabled: true,
              startAngle: 0.0,
              angleRange: 360,
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          Text(
            "Welcome!!!",
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
