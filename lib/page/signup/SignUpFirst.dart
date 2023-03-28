import 'package:buf/ViewModel/SignupViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/BoxStyleInput.dart';

class SignUpFirst extends StatefulWidget {
  const SignUpFirst({Key? key}) : super(key: key);

  @override
  State<SignUpFirst> createState() => _SignUpFirstState();
}

class _SignUpFirstState extends State<SignUpFirst> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpVIewModel>(builder: (context, signUpViewModel,child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: TextButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: Text(
            '회원가입 01',
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Center(
          child: Container(
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 1),
                  child: Text('휴대폰 번호는 안전하게 보관되며 공개되지 않습니다'),
                ),
                BoxStyleInput(
                    hint_text: '휴대폰 번호',
                    is_password: false,
                    controller:
                        TextEditingController(text: signUpViewModel.phoneNum),
                    isValid: true,
                onChanged: (value){
                  signUpViewModel.set_phoneNum(value);
                },),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  child: OutlinedButton(
                    onPressed: () {
                      //인증번호 발급 api call + 인증번호 입력창 활성화!
                      signUpViewModel.send_auth_message();
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Text(
                        '인증번호 받기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                signUpViewModel.is_sent ?
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      child: BoxStyleInput(
                          hint_text: '인증번호 입력',
                          is_password: false,
                          controller:
                          TextEditingController(text: signUpViewModel.auth_num),
                          isValid: true),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      child: OutlinedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6E9DF6))),
                        onPressed: () {
                          //인증번호 발급 api call + 인증번호 입력창 활성화!
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Text(
                            '인증번호 확인',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ) : SizedBox()
              ],
            ),
          ),
        ),
      );
    });
  }
}
