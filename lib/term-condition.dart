import 'package:flutter/material.dart';
import 'package:teman_bunda_app/helper/session_helper.dart';
import 'package:teman_bunda_app/teman_bunda_app.dart';
import 'package:teman_bunda_app/theme/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermConditionPage extends StatefulWidget {
  const TermConditionPage({super.key});

  @override
  State<TermConditionPage> createState() => _TermConditionPageState();
}

class _TermConditionPageState extends State<TermConditionPage> {
  late final WebViewController controller;
  final sessionManager = SessionHelper();
  bool agree = false;

  void toHome() {
    sessionManager.saveStatedPolicy();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
            const TemanBundaApp()),
            (Route<dynamic> route) => false);
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
    ..getScrollPosition()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://sayangbunda.semarangkota.go.id/privacy_policy'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              Text("Kebijakan Pengguna Aplikasi", style: TextStyle(color: pinkBold, fontSize: 18.0, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 500,
                child: WebViewWidget(
                    controller: controller),
              ),
              Row(
                children: [
                  Material(
                    child: Checkbox(
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value ?? false;
                        });
                      },
                    ),
                  ),
                  const Text(
                      "Saya sudah membaca dan telah menyetujui \n syarat dan ketentuan",
                      overflow: TextOverflow.ellipsis)
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: agree ? const Color(0xffD9027D):  const Color(0xffF3D1DD)
                ),
                  onPressed: () {
                    setState(() {
                      agree ? toHome() : null;
                    });
                  },
                  child: Text("Lanjutkan", style: TextStyle(color: agree? Colors.white : const Color(0xffD9027D) ),))
            ],
          ),
        ),
      ),
    );
  }
}
