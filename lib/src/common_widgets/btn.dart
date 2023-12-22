import 'package:flutter/material.dart';

elevatedBtn({
  required context,
  required double width,
  required double height,
  required btnFunction,
  required String btnText ,
  Color txtColor = const Color(0xffffffff),
  double fontSize = 48,
  Color btnColor =  const Color(0xff0e37ae),
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed:btnFunction,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,

          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: Text(btnText,style: TextStyle(fontSize: fontSize,color: txtColor),textAlign: TextAlign.center,),
      ),
    );
