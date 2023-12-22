import 'package:flutter/material.dart';

navToWithReplace({required context, required Widget nextPage}) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => nextPage));


navToWithoutReplace({required context, required Widget nextPage}) =>
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => nextPage));
