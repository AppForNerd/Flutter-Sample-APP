import 'package:appfornerds/screens/home/home_screen.dart';
import 'package:appfornerds/screens/registration_success/registration_success_screen.dart';
// import 'package:appfornerds/stores/otp.dart';
import 'package:flutter/material.dart';
import 'package:appfornerds/components/default_button.dart';
import 'package:appfornerds/size_config.dart';
import 'package:flutter/services.dart';
import 'package:appfornerds/components/form_error.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../constants.dart';

// final OTP otpStore = OTP();

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

  final List<String> errors = [];

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

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    // return Observer(
    //   builder: (_) {
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
                    // otpStore.setValue1(value);
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
                    // otpStore.setValue2(value);
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
                    // otpStore.setValue3(value);
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
                    // otpStore.setValue4(value);
                  },
                ),
              ),
            ],
          ),
          // SizedBox(height: SizeConfig.screenHeight * 0.15),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (otp1 != "" && otp2 != "" && otp3 != "" && otp4 != "") {
                if ("${otp1}${otp2}${otp3}${otp4}" == "1111") {
                  if (fromPage == 'complete_profile') {
                    Navigator.pushNamed(
                        context, RegistrationSuccessScreen.routeName);
                  } else {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }
                } else {
                  print("Invalid OTP");
                  removeError(error: kOtpNullError);
                  addError(error: kOtpInvalidError);
                }
              } else {
                print("Enter OTP");
                removeError(error: kOtpInvalidError);
                addError(error: kOtpNullError);
              }
            },
          ),
        ],
      ),
    );
    //     },
    //   );
  }
}
