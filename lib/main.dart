import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    return ScreenUtilInit(
      designSize: const Size(
        360,
        640,
      ), // Base design size (e.g., standard phone)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'LSL Calculator',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 16.sp), // Responsive text size
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
