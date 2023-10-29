import 'package:flutter/material.dart';
import 'package:flutter_health_app/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('splash screen');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        ),
      );
    });

    return Scaffold(
      body: Center(
        
        child: Container(
          height: height,
          width: width,
          child: Image.asset(
          
            'assets/images/doctors.png'),
        ),
      ),
    );
  }
}
