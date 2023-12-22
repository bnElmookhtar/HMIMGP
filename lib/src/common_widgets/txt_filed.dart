import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/lengths/fonts_size.dart';
import '../constants/strings/app_strings/user_profile.dart';

txtField({required String hint,required TextEditingController controller, int mxLines = 30, int mnLines = 25,}) =>
    TextField(

      controller: controller,
      style: TextStyle(fontSize: small_1,color: white),
      textAlign: TextAlign.justify,
      minLines: mnLines,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: deepBlue),
          label: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  description,
                  style: TextStyle(color: white),
                )),
          ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: offOrange,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: deepBlue, // Set the border color when focused
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      maxLines: mxLines,
    );
