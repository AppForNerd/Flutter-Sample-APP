import 'package:appfornerds/pages/login_page.dart';
import 'package:flutter/material.dart';

void loginRoute(context) {
  Navigator.pushReplacement(
    context,
    // MaterialPageRoute(
    //     builder: (context) => RegisterPage()),
    PageRouteBuilder(
      pageBuilder: (c, a1, a2) => LoginPage(),
      transitionsBuilder: (c, anim, a2, child) =>
          FadeTransition(opacity: anim, child: child),
      transitionDuration: Duration(milliseconds: 20),
    ),
  );
}
