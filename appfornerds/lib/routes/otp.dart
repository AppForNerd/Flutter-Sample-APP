import 'package:appfornerds/pages/otp_page.dart';
import 'package:flutter/material.dart';

void otpRoute(context) {
  Navigator.pushReplacement(
    context,
    // MaterialPageRoute(
    //     builder: (context) => RegisterPage()),
    PageRouteBuilder(
      pageBuilder: (c, a1, a2) => OtpPage(),
      transitionsBuilder: (c, anim, a2, child) =>
          FadeTransition(opacity: anim, child: child),
      transitionDuration: Duration(milliseconds: 20),
    ),
  );
}
