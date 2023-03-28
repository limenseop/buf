import 'package:flutter/cupertino.dart';

/**
 * ErrorLine : 에러메세지 표시해주는 widget
 *
 * (필수)   isError : 에러여부, true면 에러메세지가 나오고, 아니면 에러메세지 크기의 빈공간이 나옴
 * (필수)   error_msg : 에러메세지
 * (필수)   fontSize : 에러메세지 폰트크기
 */

class ErrorLine extends StatefulWidget {
  const ErrorLine({
    Key? key,
    required this.isError,
    required this.error_msg,
    required this.fontSize,
  }) : super(key: key);

  final bool isError;
  final String error_msg;
  final double fontSize;

  @override
  State<ErrorLine> createState() => _ErrorLineState();
}

class _ErrorLineState extends State<ErrorLine> {

  final Color error_color = Color(0xFFE157F8);

  @override
  Widget build(BuildContext context) {
    return widget.isError
        ? Text(
            widget.error_msg,
            style:
                TextStyle(fontSize: widget.fontSize, color: error_color),
          )
        : Container(
            height: widget.fontSize + 6,
          );
  }
}
