// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OTP on OTPBase, Store {
  final _$pin1Atom = Atom(name: 'OTPBase.pin1');

  @override
  String get pin1 {
    _$pin1Atom.reportRead();
    return super.pin1;
  }

  @override
  set pin1(String value) {
    _$pin1Atom.reportWrite(value, super.pin1, () {
      super.pin1 = value;
    });
  }

  final _$pin2Atom = Atom(name: 'OTPBase.pin2');

  @override
  String get pin2 {
    _$pin2Atom.reportRead();
    return super.pin2;
  }

  @override
  set pin2(String value) {
    _$pin2Atom.reportWrite(value, super.pin2, () {
      super.pin2 = value;
    });
  }

  final _$pin3Atom = Atom(name: 'OTPBase.pin3');

  @override
  String get pin3 {
    _$pin3Atom.reportRead();
    return super.pin3;
  }

  @override
  set pin3(String value) {
    _$pin3Atom.reportWrite(value, super.pin3, () {
      super.pin3 = value;
    });
  }

  final _$pin4Atom = Atom(name: 'OTPBase.pin4');

  @override
  String get pin4 {
    _$pin4Atom.reportRead();
    return super.pin4;
  }

  @override
  set pin4(String value) {
    _$pin4Atom.reportWrite(value, super.pin4, () {
      super.pin4 = value;
    });
  }

  final _$OTPBaseActionController = ActionController(name: 'OTPBase');

  @override
  void makeEmpty() {
    final _$actionInfo =
        _$OTPBaseActionController.startAction(name: 'OTPBase.makeEmpty');
    try {
      return super.makeEmpty();
    } finally {
      _$OTPBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue1(String value) {
    final _$actionInfo =
        _$OTPBaseActionController.startAction(name: 'OTPBase.setValue1');
    try {
      return super.setValue1(value);
    } finally {
      _$OTPBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue2(String value) {
    final _$actionInfo =
        _$OTPBaseActionController.startAction(name: 'OTPBase.setValue2');
    try {
      return super.setValue2(value);
    } finally {
      _$OTPBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue3(String value) {
    final _$actionInfo =
        _$OTPBaseActionController.startAction(name: 'OTPBase.setValue3');
    try {
      return super.setValue3(value);
    } finally {
      _$OTPBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue4(String value) {
    final _$actionInfo =
        _$OTPBaseActionController.startAction(name: 'OTPBase.setValue4');
    try {
      return super.setValue4(value);
    } finally {
      _$OTPBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pin1: ${pin1},
pin2: ${pin2},
pin3: ${pin3},
pin4: ${pin4}
    ''';
  }
}
