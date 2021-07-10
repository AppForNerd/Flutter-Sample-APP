import 'package:appfornerds/screens/home/home_screen.dart';
import 'package:appfornerds/screens/registration_success/registration_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:appfornerds/components/default_button.dart';
import 'package:appfornerds/size_config.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  // final textEditingController1;
  // final textEditingController2;
  // final textEditingController3;
  // final textEditingController4;
  OtpForm(this.textEditingController1, this.textEditingController2, this.textEditingController3, this.textEditingController4, this.fromPage);
  final textEditingController1;
  final textEditingController2;
  final textEditingController3;
  final textEditingController4;
  final fromPage;

  @override
  _OtpFormState createState() => _OtpFormState(textEditingController1, textEditingController2, textEditingController3, textEditingController4, fromPage
  );
}

class _OtpFormState extends State<OtpForm> {
  _OtpFormState(this.textEditingController1, this.textEditingController2, this.textEditingController3, this.textEditingController4, this.fromPage);
  final textEditingController1;
  final textEditingController2;
  final textEditingController3;
  final textEditingController4;
  final fromPage;

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
    print('${value.length}<-');
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
                    controller: textEditingController1,
                    autofocus: true,
                    focusNode: pin1FocusNode,
                    // obscureText: true,
                    maxLength: 1,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.length >= 1) {
                        nextField(value, pin2FocusNode);
                      } else if (value.length <= 0) {
                        nextField(value, pin1FocusNode);
                      }
                    }),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: textEditingController2,
                    focusNode: pin2FocusNode,
                    // obscureText: true,
                    maxLength: 1,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
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
                    }),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: textEditingController3,
                    focusNode: pin3FocusNode,
                    // obscureText: true,
                    maxLength: 1,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
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
                    }),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: textEditingController4,
                  focusNode: pin4FocusNode,
                  // obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                 
                  onChanged: (value) {
                    if (value.length <= 0) {
                      FocusScope.of(context).requestFocus(pin3FocusNode);
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
              if(fromPage == 'complete_profile'){
                Navigator.pushNamed(context, RegistrationSuccessScreen.routeName);
              } else {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }
}
