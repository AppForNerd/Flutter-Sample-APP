import 'package:flutter/material.dart';
import 'package:appfornerds/components/custom_surfix_icon.dart';
import 'package:appfornerds/components/default_button.dart';
import 'package:appfornerds/components/form_error.dart';
import 'package:appfornerds/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;

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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: lNameNullError);
        }
        if (value.length > 1) {
          removeError(error: lNameMinLengthError);
        }
        if (value.length <= 30) {
          removeError(error: nameMaxLengthError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: lNameNullError);
          return "";
        } else if (value.length < 1) {
          addError(error: lNameMinLengthError);
          return "";
        } else if (value.length >= 30) {
          addError(error: nameMaxLengthError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: fNameNullError);
        }
        if (value.length > 3) {
          removeError(error: fNameMinLengthError);
        }
        if (value.length <= 30) {
          removeError(error: nameMaxLengthError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: fNameNullError);
          return "";
        } else if (value.length < 3) {
          addError(error: fNameMinLengthError);
          return "";
        } else if (value.length >= 30) {
          addError(error: nameMaxLengthError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
