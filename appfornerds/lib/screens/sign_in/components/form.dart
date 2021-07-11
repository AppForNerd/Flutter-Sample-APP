import 'package:appfornerds/components/custom_prefix_icon.dart';
import 'package:appfornerds/screens/complete_profile/complete_profile_screen.dart';
import 'package:appfornerds/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appfornerds/components/default_button.dart';
import 'package:appfornerds/components/form_error.dart';
import 'package:appfornerds/helper/keyboard.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String phoneNumber;

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneNumberFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
                // if all are valid then go to success screen
                if (phoneNumber == "1111111111") {
                  Navigator.pushNamed(context, OtpScreen.routeName, arguments: {
                    "countryCode": countryCode != null ? countryCode : '+91',
                    "phoneNumber": phoneNumber,
                    "fromPage": 'login'
                  });
                } else {
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName,
                      arguments: {
                        "countryCode":
                            countryCode != null ? countryCode : '+91',
                        "phoneNumber": phoneNumber
                      });
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        if (value.length == 10) {
          removeError(error: kPhoneNumberLengthError);
        }

        phoneNumber = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } else if (value.length != 10) {
          addError(error: kPhoneNumberLengthError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(0),
          getProportionateScreenWidth(0),
          getProportionateScreenWidth(25),
          getProportionateScreenWidth(0),
        ),
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        hintStyle: TextStyle(fontSize: getProportionateScreenWidth(15)),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: CustomPrefixIcon(),
      ),
    );
  }
}
