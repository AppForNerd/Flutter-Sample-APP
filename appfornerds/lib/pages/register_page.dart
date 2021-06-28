import 'package:appfornerds/routes/login.dart';
import 'package:appfornerds/routes/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30)),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 3.0),
                      borderRadius: BorderRadius.circular(32.0)),
                  child: TextFormField(
                    autofocus: true,
                    style: TextStyle(fontSize: 20, letterSpacing: 1.0),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[
                      // FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(30)
                    ], // Only numbers can be entered,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(32.0)),
                        // border: OutlineInputBorder(),
                        // labelText: 'Phone Number',
                        border: InputBorder.none,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1.0,
                            fontStyle: FontStyle.normal),
                        // labelStyle: TextStyle(
                        //     fontSize: 13,
                        //     letterSpacing: 1.0,
                        //     fontStyle: FontStyle.normal),
                        counterText: ''),
                    // style: TextStyle(fontSize: 20),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 3.0),
                    borderRadius: BorderRadius.circular(32.0)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      // child: Container(
                      // padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                      // decoration: BoxDecoration(
                      //   border:
                      //       Border.all(color: Colors.black, width: 1.0),
                      // ),
                      child: CountryCodePicker(
                        // onChanged: print,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        textStyle: TextStyle(fontSize: 15, color: Colors.black),
                        hideSearch: true,
                        initialSelection: 'IN',
                        // countryFilter: ['IN', 'US', 'GB', 'AF', 'AU', 'AU', 'SL', 'NZ'],
                        // favorite: ['+91', 'IN'],
                        // optional. Shows only country name and flag
                        showCountryOnly: true,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      // child: Container(
                      //   alignment: Alignment.center,
                      // padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
                      child: TextFormField(
                        autofocus: true,
                        style: TextStyle(fontSize: 20, letterSpacing: 3.0),
                        textAlign: TextAlign.center,
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ], // Only numbers can be entered,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(32.0)),
                            // // border: OutlineInputBorder(),
                            // labelText: 'Phone Number',
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1.0,
                                fontStyle: FontStyle.normal),
                            // labelStyle: TextStyle(
                            //     fontSize: 13,
                            //     letterSpacing: 1.0,
                            //     fontStyle: FontStyle.normal),
                            counterText: ''),
                      ),
                      // ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                width: double.infinity,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    //otp screen
                    otpRoute(context);
                  },
                  icon: Icon(Icons.login),
                  label: Text("Send OTP"),
                ),
              ),
              Spacer(),
              Container(
                // padding: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Already have an account? '),
                        TextButton(
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            //signin screen
                            loginRoute(context);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
