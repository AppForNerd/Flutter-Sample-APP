import 'package:flutter/material.dart';

import 'components/body.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  static String routeName = "/registration_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(width: double.infinity),
        // title: Text("Registration Success"),
      ),
      body: Body(),
    );
  }
}
