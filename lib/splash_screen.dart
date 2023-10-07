import 'package:flutter/material.dart';
import 'package:teman_bunda_app/helper/session_helper.dart';
import 'package:teman_bunda_app/teman_bunda_app.dart';
import 'package:teman_bunda_app/term-condition.dart';
import 'package:teman_bunda_app/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final sessionManager = SessionHelper();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      checkAgreementAccept();
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) =>
      //         const TermConditionPage()),
      //         (Route<dynamic> route) => false);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('asset/image/logo-teman-bunda.png'),
              const SizedBox(height: 8.0),
              Text('Sistem Pemantauan Kesehatan Ibu dan Anak Kota Semarang',
                style: TextStyle(
                    color: pinkBold, fontWeight: FontWeight.w600, fontSize: 18),
                textAlign: TextAlign.center,),
            ],
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text('©Pemerintah Kota Semarang'),
              ))
        ],
      ),
    );
  }

  Future<bool> checkAgreementAccept() async {
    var checkAccept = await sessionManager.isAccept();
    if (checkAccept != null && checkAccept == true) {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                const TemanBundaApp()),
                (Route<dynamic> route) => false);
      }
      return checkAccept;
    }
    else {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                const TermConditionPage()),
                (Route<dynamic> route) => false);
      }
      return false;
    }
  }
}