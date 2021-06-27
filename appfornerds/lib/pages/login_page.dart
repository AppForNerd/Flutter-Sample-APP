import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF00CCFF), Colors.white])),
                child: Column(
              children: <Widget>[
                SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Hero(
                    tag: 'hero',
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 48.0,
                      child: Image.asset(
                          'img/logo.png'),
                    ),
                  ),
                ),
                // Container(
                //     alignment: Alignment.center,
                //     padding: EdgeInsets.all(10),
                //     child: Text(
                //       'Tree App',
                //       style: TextStyle(
                //           color: Colors.blue,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 30),
                //     )),
                // Container(
                //     alignment: Alignment.center,
                //     padding: EdgeInsets.fromLTRB(0, 30, 0, 30)),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
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
                          textStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
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
                        // ),
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
                              labelStyle: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 1.0,
                                  fontStyle: FontStyle.normal),
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
                    onPressed: () {},
                    icon: Icon(Icons.login),
                    label: Text("Send OTP"),
                  ),
                ),
                Spacer(),
                Container(
                    // padding: EdgeInsets.only(bottom: 10.0),
                    child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Does not have account? '),
                      TextButton(
                        child: Text(
                          'Sign up',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          //signup screen
                        },
                      )
                    ],
                  )
                ]))
              ],
            ))));
  }
}
