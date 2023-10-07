import 'package:flutter/material.dart';
import 'package:teman_bunda_app/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TemanBundaApp extends StatefulWidget {
  const TemanBundaApp({super.key});

  @override
  State<TemanBundaApp> createState() => _TemanBundaAppState();
}

class _TemanBundaAppState extends State<TemanBundaApp> {
  late final WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
        onNavigationRequest: (NavigationRequest request){
          if(request.url.startsWith("tel")){
            launchUrl(Uri.parse(request.url));
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..getScrollPosition()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(true)
      ..loadRequest(
          Uri.parse('https://sayangbunda.semarangkota.go.id/TemanBunda'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
                controller: controller),
            if (loadingPercentage < 100)
              LinearProgressIndicator(color: pinkBold, value: loadingPercentage / 100.0)
          ],
        ),
      ),
    );
  }
}
