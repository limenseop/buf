import 'package:buf/ViewModel/SignupViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/BoxStyleInput.dart';
import '../../widget/ErrorLine.dart';

class SignUpSecond extends StatefulWidget {
  const SignUpSecond({Key? key}) : super(key: key);

  @override
  State<SignUpSecond> createState() => _SignUpSecondState();
}

class _SignUpSecondState extends State<SignUpSecond> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpVIewModel>(
        builder: (context, signUpListView, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: TextButton(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  //뒤로가기
                },
              ),
              title: Text(
                '회원가입 02',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            body: Center(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Expanded(
                          child: BoxStyleInput(
                            title: '아이디',
                            hint_text: '영어, 숫자 조합 2~10자리',
                            is_password: false,
                            isValid: true,
                            onChanged: (value) {
                              signUpListView.set_id(value);
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5, top: 34),
                          child: OutlinedButton(
                            style: ButtonStyle(side:
                            MaterialStateProperty.resolveWith<BorderSide>(
                                    (Set<MaterialState> states) {
                                  return BorderSide(
                                    color: Colors.grey,
                                  );
                                })),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 18.1),
                              child: Text(
                                '중복확인',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    BoxStyleInput(
                      title: '비밀번호',
                      hint_text: '영어, 숫자 조합 6자리 이상',
                      is_password: true,
                      isValid: true,
                      onChanged: (value) {
                        signUpListView.set_password(value);
                      },
                    ),
                    BoxStyleInput(
                      hint_text: '영어, 숫자 조합 6자리 이상',
                      is_password: true,
                      isValid: !signUpListView.compare_password(),
                      onChanged: (value) {
                        signUpListView.set_passwordCheck(value);
                      },
                    ),
                    ErrorLine(isError: !signUpListView.compare_password(),
                        error_msg: 'error_dummy',
                        fontSize: 11),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
