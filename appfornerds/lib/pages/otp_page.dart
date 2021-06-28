import 'package:appfornerds/routes/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:appfornerds/routes/login.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OtpPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<OtpPage> {
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController(text: "");
  // bool isResendClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tree App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Column(
            children: <Widget>[
              Spacer(),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    'Enter OTP',
                    style: TextStyle(fontSize: 20),
                  )),
              PinCodeTextField(
                pinBoxWidth: 40,
                autofocus: true,
                controller: otpController,
                hideCharacter: false,
                // maskCharacter: "🐶",
                highlight: true,
                highlightColor: CupertinoColors.activeBlue,
                defaultBorderColor: CupertinoColors.activeBlue,
                hasTextBorderColor: CupertinoColors.activeBlue,
                maxLength: 6,
                pinBoxBorderWidth: 3,
                hasError: false,
                // onTextChanged: (text) {
                //   setState(() {});
                // },
                isCupertino: true,
                onDone: (text) {
                  print("DONE $text");
                  // navigate to home page
                },
                wrapAlignment: WrapAlignment.end,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.roundedPinBoxDecoration,
                pinTextStyle: TextStyle(fontSize: 30.0),
                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                highlightAnimation: true,
                highlightAnimationBeginColor: CupertinoColors.activeBlue,
                highlightAnimationEndColor: Colors.white30,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Didn\'t receive the code? '),
                        TextButton(
                          child: Text(
                            'Resend',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            print("Resend OTP Clicked!");
                            // resent OTP
                            // resendOTP(phoneNumberController);

                            //otp screen
                            otpRoute(context);
                            // setState(() {
                            //   otpController.clear();
                            // });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Go back to '),
                        TextButton(
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            //signin screen
                            loginRoute(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
