import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'password_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PasswordScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate responsive image size based on screen width
          double imageSize = constraints.maxWidth * 0.6; // 60% of screen width
          if (imageSize > 500) imageSize = 500; // Max size cap
          if (imageSize < 200) imageSize = 200; // Min size cap

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: imageSize.w,
                  height: imageSize.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
