import 'package:appfornerds/screens/home/home_screen.dart';
import 'package:appfornerds/screens/registration_success/registration_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:appfornerds/components/default_button.dart';
import 'package:appfornerds/size_config.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  OtpForm(this.fromPage);
  final fromPage;

  @override
  _OtpFormState createState() => _OtpFormState(fromPage);
}

class _OtpFormState extends State<OtpForm> {
  _OtpFormState(this.fromPage);
  final fromPage;

  String otp1 = "";
  String otp2 = "";
  String otp3 = "";
  String otp4 = "";

  FocusNode pin1FocusNode;
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  bool enableContinue = false;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  focusNode: pin1FocusNode,
                  maxLength: 1,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length >= 1) {
                      nextField(value, pin2FocusNode);
                    }
                    otp1 = value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  maxLength: 1,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length >= 1) {
                      nextField(value, pin3FocusNode);
                    } else if (value.length <= 0) {
                      FocusScope.of(context).requestFocus(pin1FocusNode);
                    }
                    otp2 = value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  maxLength: 1,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length >= 1) {
                      nextField(value, pin4FocusNode);
                    } else if (value.length <= 0) {
                      FocusScope.of(context).requestFocus(pin2FocusNode);
                    }
                    otp3 = value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length <= 0) {
                      FocusScope.of(context).requestFocus(pin3FocusNode);
                      // Then you need to check is the code is correct or not
                    }
                    otp4 = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
              if (otp1 != "" && otp2 != "" && otp3 != "" && otp4 != "") {
                if (fromPage == 'complete_profile') {
                  Navigator.pushNamed(
                      context, RegistrationSuccessScreen.routeName);
                } else {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
