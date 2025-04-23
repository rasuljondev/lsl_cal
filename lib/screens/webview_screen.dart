import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize WebViewController
    _controller =
        WebViewController()
          ..setJavaScriptMode(
            JavaScriptMode.unrestricted,
          ) // Enable JavaScript for Desmos
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Optional: Show loading progress
                print('Loading: $progress%');
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {
                print('Error: ${error.description}');
              },
              onNavigationRequest: (NavigationRequest request) {
                // Restrict navigation to Desmos domain
                if (request.url.startsWith('https://www.desmos.com')) {
                  return NavigationDecision.navigate;
                }
                return NavigationDecision.prevent;
              },
            ),
          )
          ..loadRequest(Uri.parse('https://www.desmos.com/calculator'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
