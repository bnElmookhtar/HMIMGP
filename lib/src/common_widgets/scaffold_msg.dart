import 'package:flutter/material.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/lengths/fonts_size.dart';

scaffoldMsg({required String msg, required context, bool closeIcon = false,int duration = 1000}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Align(
          alignment: Alignment.center,
          child: Text(
            msg,
            style: TextStyle(fontSize: medium, color: white),
          ),
        ),
        padding: EdgeInsets.all(25),
        backgroundColor: deepBlue,
        showCloseIcon: closeIcon,
        duration: Duration(milliseconds:duration ),
      ),
    );
