import 'package:flutter/material.dart';

import '../constants/lengths/margines_paddings.dart';
import '../constants/strings/image_paths.dart';

appCoverContainer({required context}) =>
    AnimatedPositioned(
      duration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      child:  Container(
        width: gWidth(context, 0.4),
        height: gHeight(context, 1),
        child: Image(
          image: const AssetImage(
            facultyImgTwo,
          ),
          width: gWidth(context, 1),
          height: gHeight(context, 1),
          fit: BoxFit.cover,
        ),
      ),
    );
