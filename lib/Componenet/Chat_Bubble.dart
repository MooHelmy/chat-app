import 'package:chatt_app/Model/Mess_model.dart';
import 'package:flutter/cupertino.dart';
import 'context.dart';

class ChatBappule extends StatelessWidget {
  @override
  ChatBappule({required this.messagee});
  Messagee messagee;
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        decoration: BoxDecoration(
            color: Kprimary_color,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32))),
        child: Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 32,left: 16,right:16 ),
          child: Text(
           messagee.message,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
class ChatBappuleforFrend extends StatelessWidget {
  @override
  ChatBappuleforFrend({required this.messagee});
  Messagee messagee;
  Widget build(BuildContext context) {


    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        decoration: BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32))),
        child: Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 32,left: 16,right:16 ),
          child: Text(
            messagee.message,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}