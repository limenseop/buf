import 'package:buf/ViewModel/LoginViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widget/BoxStyleInput.dart';
import '../../widget/ErrorLine.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
        builder: (context, loginViewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text('widget.title'),
              ),
              body: Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ErrorLine(isError: loginViewModel.error, error_msg: loginViewModel.error_msg, fontSize: 13),
                      //Text(userService.is_error() ? userService.get_error() : "   "),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoxStyleInput(
                            hint_text: '아이디',
                            is_password: false,
                            isValid: !loginViewModel.error,
                            onChanged: (value) {
                              loginViewModel.set_id(value);
                            },
                          ),
                          BoxStyleInput(
                            hint_text: '비밀번호',
                            is_password: true,
                            isValid: !loginViewModel.error,
                            onChanged: (value) {
                              loginViewModel.set_password(value);
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '아이디 찾기',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: Center(
                                        child: Text(
                                          '|',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.grey,
                                          ),
                                        ))),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '비밀번호 찾기',
                                    style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text('아직 회원이 아니신가요?',
                                        style: TextStyle(color: Colors.grey)),
                                    margin: EdgeInsets.only(left: 8)),
                                Container(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '회원가입하기',
                                        style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Colors.black),
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: loginViewModel.can_login ? MaterialStateProperty.all(Color(0xFF6E9DF6)) : MaterialStateProperty.all(Colors.grey)),
                              onPressed: () {
                                if(loginViewModel.can_login) {
                                  loginViewModel.try_login();
                                }
                              },
                              child: Text('로그인',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)))
                    ],
                  ),
                ),
              ));
        });
  }
}