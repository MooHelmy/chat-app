import 'package:flutter/material.dart';

class Compon_text extends StatelessWidget {
  Compon_text({required this.hinte, this.onchange,this.obscureText=false});
  String? hinte;
  bool obscureText;
  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Failed is Required';
        }
      },
      onChanged: onchange,
      decoration: InputDecoration(
          hintText: hinte,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                BorderSide(color: Colors.white, style: BorderStyle.solid),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.pink,
            style: BorderStyle.solid,
          ))),
    );
  }
}
