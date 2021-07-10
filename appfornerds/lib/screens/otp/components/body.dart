import 'package:flutter/material.dart';
import 'package:appfornerds/constants.dart';
import 'package:appfornerds/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  final TextEditingController textEditingController1 =
      new TextEditingController();
  final TextEditingController textEditingController2 =
      new TextEditingController();
  final TextEditingController textEditingController3 =
      new TextEditingController();
  final TextEditingController textEditingController4 =
      new TextEditingController();

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
              new OtpForm(textEditingController1, textEditingController2,
                  textEditingController3, textEditingController4, rcvdData['fromPage']),
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
                    textEditingController1.clear();
                    textEditingController2.clear();
                    textEditingController3.clear();
                    textEditingController4.clear();
                    FocusScope.of(context).previousFocus();
                    FocusScope.of(context).previousFocus();
                    FocusScope.of(context).previousFocus();
                  },
                  child: const Text(
                    "Resend OTP Code",
                    style: TextStyle(color: kTextColor),
                  ),
                ),
              ),
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
