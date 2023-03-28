import 'package:buf/service/LoginService.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel with ChangeNotifier {

  final LoginService loginService = LoginService();

  String _id = '';
  String _password = '';

  String _prev_id = '';
  String _prev_password = '';

  bool _can_login = false;
  bool _error = false;
  String _error_msg = "";

  /**
   * getter
   * */

  String get id => _id;

  String get password => _password;

  String get wrong_id => _prev_id;

  String get wrong_password => _prev_password;

  bool get can_login => _can_login;

  bool get error => _error;

  String get error_msg => _error_msg;

  /**
   * logic
   */

  void set_id(String value) {
    _id = value;
    _check_can_login();
    notifyListeners();
  }

  void set_password(String value) {
    _password = value;
    _check_can_login();
    notifyListeners();
  }

/**
 * private
 */

  void _check_can_login() {
    if(_id.isNotEmpty && _password.isNotEmpty){
      _can_login = true;
    }else{
      _can_login = false;
    }
  }

  void try_login(){
    //validation
    if(_id.isEmpty){
      _error = true;
      _error_msg = "아이디를 입력해주세요!";
      return;
    }
    if(_password.isEmpty){
      _error = true;
      _error_msg = "비밀번호를 입력해주세요!";
      return;
    }
    if(!_can_login){
      _error = true;
      _error_msg = "로그인 할 수 없습니다!";
      return;
    }
    //response -> 로그인 result
    bool is_possible = true;
    if(is_possible){
      //로그인 이후 세팅하기
      /**
       * 로그인 이후 유저정보 provider에 보관하기
       * 저장해야 할 정보 : JWT access / refresh token
       * userData : userId, username.. etc
       */
    }
    _error = !_error;
    if(_error){
      _prev_id = _id;
      _prev_password = _password;
    }
    _error_msg = '테스팅';
  }


}