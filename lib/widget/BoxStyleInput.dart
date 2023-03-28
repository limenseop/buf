import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * box style input -> 아이디 비밀번호 입력란 처럼 box형식의 input getter
 *
 * (필수아님) title : 입력박스 상단에 띄울 text
 * (필수)    hint_text : 입력박스 안에 회색으로 적을 placeholder
 * (필수)    is_password : 비밀번호 가림 처리 여부
 * (필수아님) controller : 입력란이랑 연동할 controller
 * (필수아님) onSubmitted : 해당 form 제출시 실행할 코드
 * (필수)    isValid : 우리 입력란에서 해당 정보가 에러나면 핑크색 처리하잖어 그거 background color을 핑크로 할지 여부,
 * (필수아님) onChanged : 해당 textField가 change시 실행할 callback, 여기에 setter넣는게 더 좋더라
 */

class BoxStyleInput extends StatefulWidget {
  const BoxStyleInput({
    Key? key,
    String? this.title,
    required this.hint_text,
    required this.is_password,
    TextEditingController? this.controller,
    Function(String)? this.onSubmitted,
    required this.isValid,
    ValueChanged? this.onChanged,
  }) : super(key: key);

  final String? title;
  final String hint_text;
  final bool is_password;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final ValueChanged<String>? onChanged;
  final bool isValid;

  @override
  State<BoxStyleInput> createState() => _practiceState();
}

class _practiceState extends State<BoxStyleInput> {
  final _formkey = GlobalKey<FormState>();
  final Color invalid_color = Color(0xFFF5E4F5);                                //해당 textField 에러시의 background color
  final Color invalid_outline_color = Color(0xFFE9BEED);                        //해당 textField 에러시의 border color
  final _focusNode = FocusNode();                                               //focus처리할때 필요한거, 무시해도됨!
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final back_color = widget.isValid ? Colors.white : invalid_color;
    final fill_color = _isFocused ? Colors.white : back_color;
    final outline_color = widget.isValid ? Colors.grey : invalid_outline_color;
    final outline_color_focus = widget.isValid ? Colors.black : invalid_outline_color;
    return Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: (widget.title == null)
                  ? null
                  : Text(
                widget.title!,
                style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.only(left: 1,bottom: 11),
            ),
            TextFormField(
              focusNode: _focusNode,
              obscureText: widget.is_password,
              onChanged: widget.onChanged ?? (_) {},
              decoration: InputDecoration(
                  hintText: widget.hint_text,
                  filled: true,
                  fillColor: fill_color,
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: outline_color_focus,
                    ),
                    borderRadius: BorderRadius.circular(3),
                    gapPadding: 100,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: outline_color,
                      ),
                      borderRadius: BorderRadius.circular(3))),
              validator: (value) {
                if (value!.isEmpty) {
                } else {
                  return null;
                }
              },
            ),
          ],
        ));
  }
}