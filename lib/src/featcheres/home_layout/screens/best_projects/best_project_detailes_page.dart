import 'package:flutter/material.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/lengths/fonts_size.dart';
import 'package:hmimgp/src/constants/lengths/margines_paddings.dart';

class BestProjectPage extends StatelessWidget {
  const BestProjectPage(
      {super.key, required this.projectName, required this.projectDescription, required this.projectImagePath});
  final String projectName;
  final String projectDescription;
  final String projectImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectName),
        centerTitle: true,
        backgroundColor: deepBlue,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: gWidth(context, 1),
              height: gHeight(context, 0.3),
              decoration: BoxDecoration(
                color: offOrange,
                image: DecorationImage(
                  image: AssetImage(projectImagePath),
                  fit: BoxFit.contain
                )
              ),
            ),
            Container(
              width: gWidth(context, 1),
              height: gHeight(context, 0.6),
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: paddingWidth(context, 0.02)),
              color:offOrange,
              child: Text(
                projectDescription,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: small_1,
                  color: deepBlue
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
