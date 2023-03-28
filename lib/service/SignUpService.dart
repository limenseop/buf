import 'package:flutter/cupertino.dart';
/**
 * SignUpService : 회원가입 서비스
 * 회원가입시의 Business logic을 처리하는 부분
 */

class SignUpService extends ChangeNotifier {
  final RegExp _phoneRegExp = RegExp(r'^01[0-9]{1}-[0-9]{3,4}-[0-9]{4}$');
  final RegExp _idRegExp = RegExp(r'^[a-z0-9]{2,10}$');
  final RegExp _passwordRegExp = RegExp(r'^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}$');


  bool isPhoneNumber(String value) {
    // 010-1234-5678 형태의 전화번호 패턴
    return _phoneRegExp.hasMatch(value);
  }

  bool isValidId(String value){
    return _idRegExp.hasMatch(value);
  }

  bool isValidPassword(String value){
    return _passwordRegExp.hasMatch(value);
  }
}
