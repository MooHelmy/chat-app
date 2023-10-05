import 'package:flutter/material.dart';
class Compon_Button extends StatelessWidget{
  Compon_Button({required this.name,this.ontap});
  VoidCallback? ontap;
  String name;
  @override
  Widget build(BuildContext context) {
 return GestureDetector(
   onTap: ontap,
   child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    width: double.infinity,
    height: 65,
    child: Center(
      child: Text(name,style: TextStyle(fontSize: 24),

      ),
    ),
),
 );
  }

}