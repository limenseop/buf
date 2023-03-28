import 'package:buf/service/SignUpService.dart';
import 'package:flutter/cupertino.dart';

class SignUpVIewModel extends ChangeNotifier {
  final SignUpService signUpService = SignUpService();

  //page 1
  String _phoneNum = '';
  String _auth_num = '';
  bool _is_sent = false;
  bool _valid_phone = false;

  //page 2
  String _id = '';
  String _password = '';
  String _password_check = '';
  String _nickname = '';
  bool _invalid_id = false;
  bool _duplicated_nickname = false;
  bool _invalid_password = false;
  String _id_err_msg = '';
  String _password_err_msg = '';


  /**4
   * getter
   */

  String get phoneNum => _phoneNum;

  String get auth_num => _auth_num;

  String get id => _id;

  String get password => _password;

  String get password_check => _password_check;

  String get nickname => _nickname;

  bool get is_sent => _is_sent;

  bool get duplicated_id => _invalid_id;

  bool get duplicated_nickname => _duplicated_nickname;

  bool get password_wrong => _invalid_password;

  bool get valid_phone => _valid_phone;

  String get password_err_msg => _password_err_msg;

  String get id_err_msg => _id_err_msg;

  /**
   * logic
   */

  //page 1

  void set_phoneNum(String value) {
    _phoneNum = value;
    notifyListeners();
  }

  void set_authNum(String value) {
    _auth_num = value;
    notifyListeners();
  }

  void send_auth_message() {
    if (_phoneNum.isEmpty) {
      //비어있을때의 예외처리
      return;
    } else {
      if (!signUpService.isPhoneNumber(_phoneNum)) {
        //핸드폰 양식이 아닐때의 예외처리
        _phoneNum = '';
        notifyListeners();
        return;
      } else {
        //핸드폰 양식이 맞을때의 handling
        _valid_phone = true;
        _is_sent = true;
        notifyListeners();
      }
    }
  }

  void check_authNum(String authNum){
    //인증번호 확인 로직
  }

  //page2

  void set_id(String value){
    if(!signUpService.isValidId(value)){
      _invalid_id = true;
      _id_err_msg = '소문자, 숫자 조합 2~10자리의 아이디를 입력해주세요!';
      notifyListeners();
      return;
    }
    _invalid_id = false;
    _id = value;
    notifyListeners();
  }

  void set_password(String value){
    if(!signUpService.isValidPassword(value)){
      _invalid_password = true;
      _password_err_msg = '소문자, 숫자 조합 6자리 이상을 입력해주세요!';
      notifyListeners();
      return;
    }
    _invalid_password = false;
    _password = value;
    notifyListeners();
  }

  void set_passwordCheck(String value){
    _password_check = value;
    notifyListeners();
  }

  void set_nickname(String value){
    _nickname = value;
    notifyListeners();
  }

  bool compare_password() {
    if (_password.isEmpty) {
      return false;
    }
    if (_password_check.isEmpty) {
      return false;
    }
    if (!(_password_check == _password)) {
      _invalid_password = true;
      _password_err_msg = '비밀번호가 일치하지 않습니다!';
      notifyListeners();
      return false;
    }
    _invalid_password = false;
    return true;
  }

  void verify_unduplicated_id(){

  }

  void verify_unduplicated_nickname(){

  }
}
