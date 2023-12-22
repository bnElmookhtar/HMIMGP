import 'package:flutter/material.dart';

import '../btn_functions/navigation.dart';
import '../constants/colors.dart';
import '../featcheres/on_boarding/screens/welcome.dart';
floatingActionButton(BuildContext context,nextPage)=>FloatingActionButton(
  onPressed: () {
    navToWithReplace(context: context, nextPage:nextPage);
  },
  backgroundColor: deepBlue,
  child: Icon(
    Icons.arrow_forward_rounded,
    color: white,
    size: 50,
  ),
);