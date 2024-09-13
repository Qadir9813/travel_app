import 'package:flutter/material.dart';
import 'package:travel_app/Screens/MainPage.dart';
import 'package:travel_app/Style/fonts.dart';
import '../Style/Colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  FontStyleConfig fontStyle=FontStyleConfig();
  @override
  void initState() {
    super.initState();
    // Introduce a delay before navigating to the main page
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Mainpage()),
      );
    });
  }

    @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colors.lightBlue, // Starting color (#0172B2)
              colors.darkBlue, // Ending color (#001645)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Travel',
                  style:fontStyle.splashTitleStyle()
                ),
                SizedBox(width: 20,),
                Image.asset('assets/images/globe icon.png')
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text('Find Your Dream\n Destination With Us',
            textAlign: TextAlign.center,
            style: fontStyle.splashTextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
