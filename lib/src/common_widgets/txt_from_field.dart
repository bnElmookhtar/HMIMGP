import 'package:flutter/material.dart';
import '../constants/colors.dart';


class GenericTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  GenericTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.maxLength,
    this.theirIsSuffixIcon = false,
    this.onsuffixIconPressed,
    this.validateField,
    this.isPassword = false,
    this.txtColor =const Color(0xff041749),
  });
  final int maxLength;

  bool theirIsSuffixIcon ;

  bool isPassword = false;

  bool isSecurePassword = false;

  final  onsuffixIconPressed;

  Color txtColor =  Color(0xff041749);
  final validateField;
  @override
  State<GenericTextFormField> createState() => _GenericTextFormFieldState();
}

class _GenericTextFormFieldState extends State<GenericTextFormField> {



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(color: widget.txtColor),
      decoration: InputDecoration(
        suffix: widget.theirIsSuffixIcon
            ? IconButton(
                onPressed: widget.onsuffixIconPressed,
                icon: Icon(Icons.add, color: deepBlue),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: offOrange,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: deepBlue),
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.isSecurePassword = !widget.isSecurePassword;
                  });
                },
                icon: Icon(widget.isSecurePassword? Icons.visibility_off:Icons.visibility,))
            :null,
        labelText: widget.label,
        labelStyle: TextStyle(color: deepBlue),
      ),
      obscureText:widget.isSecurePassword ,
      cursorColor: deepBlue,
      cursorWidth: 2,
      cursorRadius: Radius.circular(5),
      maxLength: widget.maxLength,
      validator: widget.validateField,
    );
  }
}
