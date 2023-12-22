import 'package:flutter/material.dart';
import 'package:hmimgp/src/constants/lengths/fonts_size.dart';

import '../constants/colors.dart';
import '../constants/lengths/margines_paddings.dart';

class UserProfileBar extends StatelessWidget {
  const UserProfileBar({
    super.key,
    required this.username,
    required this.email,
  });
  final String username, email;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: gHeight(context, 0.2),
        width: gWidth(context, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: white),
                width: 200,
                child: Center(
                  child: Text(
                    username[0].toUpperCase(),
                    style: TextStyle(color: offOrange, fontSize: large),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListTile(
                title: Text(
                  username,
                  style: TextStyle(color: white, fontSize: medium),
                ),
                subtitle: Text(
                  email,
                  style: TextStyle(color: white, fontSize: small_1),
                ),
              ),
            )
          ],
        ));
  }
}
