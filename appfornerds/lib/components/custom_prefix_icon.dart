import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../size_config.dart';

class CustomPrefixIcon extends StatefulWidget {
  @override
  _CustomPrefixIconState createState() => _CustomPrefixIconState();
}

CountryCode countryCode;

class _CustomPrefixIconState extends State<CustomPrefixIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(120),
      child: CountryCodePicker(
          onChanged: (value) {
            setState(() {
              countryCode = value;
            });
          },
          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          initialSelection: 'IN',
          // optional. Shows only country name and flag
          showCountryOnly: true,
          // optional. Shows only country name and flag when popup is closed.
          showOnlyCountryWhenClosed: false,
          // optional. aligns the flag and the Text left
          alignLeft: true,
          hideSearch: true,
          textStyle: TextStyle(color: Colors.black)),
    );
  }
}
