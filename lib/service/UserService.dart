import 'package:buf/ViewModel/LoginViewModel.dart';
import 'package:flutter/cupertino.dart';

/**
 * UserService : 유저정보를 다루는 Service layer
 * 로그인뿐만 아니라 다른 화면에서 유저정보를 요구할때 (jwtToken) 아마 여기서 처리할듯?
 */

class UserService extends ChangeNotifier {
  final LoginViewModel _loginService = LoginViewModel();
  //final UserProvider _userProvider = UserProvider();
  //User? user;
  //isLogin = false;

  void input_login_id(String value){
    _loginService.set_id(value);
    notifyListeners();
  }

  void input_login_password(String value){
    _loginService.set_password(value);
    notifyListeners();
  }

  void login(){
    final result = _loginService.try_login();
    notifyListeners();
    /*if(result.isSuccess){
        user = UserProvider.load_user(result.userId);
        isLogin = true;
        notifyListeners();
    }*/
  }


}