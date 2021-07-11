import 'package:flutter/material.dart';
import 'package:appfornerds/constants.dart';
import 'package:appfornerds/size_config.dart';

import '../otp_screen.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text(
                  "We sent your code to ${rcvdData['countryCode']} ${rcvdData['phoneNumber']}"),
              buildTimer(),
              new OtpForm(rcvdData['fromPage']),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, OtpScreen.routeName,
                        arguments: {
                          "countryCode": rcvdData['countryCode'] != null
                              ? rcvdData['countryCode']
                              : '+91',
                          "phoneNumber": rcvdData['phoneNumber'],
                          "fromPage": rcvdData['fromPage']
                        });
                  },
                  child: const Text(
                    "Resend OTP Code",
                    style: TextStyle(color: kTextColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
