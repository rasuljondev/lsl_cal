import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class WebViewScreen extends StatefulWidget {
  final String exitPassword;

  const WebViewScreen({super.key, required this.exitPassword});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://www.desmos.com/calculator'));
  }

  Future<bool> _onWillPop() async {
    _promptExit();
    return false; // Prevent default back action
  }

  void _promptExit() {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Enter Password to Exit',
              style: TextStyle(fontSize: 18.sp),
            ),
            content: TextField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 14.sp),
              ),
              style: TextStyle(fontSize: 16.sp),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel', style: TextStyle(fontSize: 14.sp)),
              ),
              TextButton(
                onPressed: () {
                  if (controller.text == widget.exitPassword) {
                    Navigator.pop(context);
                    Future.delayed(const Duration(milliseconds: 200), () {
                      exit(0); // Force close app
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Incorrect password",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    );
                  }
                },
                child: Text('Exit', style: TextStyle(fontSize: 14.sp)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(controller: _controller),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: IconButton(
                  icon: Icon(Icons.exit_to_app, color: Colors.red, size: 30.sp),
                  onPressed: _promptExit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
