import 'package:mobx/mobx.dart';

part 'otp.g.dart';

class OTP = OTPBase with _$OTP;

abstract class OTPBase with Store {
  @observable
  String pin1;
  @observable
  String pin2;
  @observable
  String pin3;
  @observable
  String pin4;

  @action
  void makeEmpty() {
    pin1 = pin2 = pin3 = pin4 = "";
  }

  @action
  void setValue1(String value) {
    pin1 = value;
  }

  @action
  void setValue2(String value) {
    pin2 = value;
  }

  @action
  void setValue3(String value) {
    pin3 = value;
  }

  @action
  void setValue4(String value) {
    pin4 = value;
  }
}
