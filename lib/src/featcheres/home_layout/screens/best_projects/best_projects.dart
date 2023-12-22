import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hmimgp/src/btn_functions/navigation.dart';
import 'package:hmimgp/src/common_widgets/bestProjectCard.dart';
import 'package:hmimgp/src/constants/strings/image_paths.dart';
import 'package:hmimgp/src/featcheres/home_layout/screens/best_projects/best_project_detailes_page.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/lengths/margines_paddings.dart';
import '../../../../constants/strings/app_strings/home_layout.dart';

class BestProjects extends StatelessWidget {
  const BestProjects({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomIndex = random.nextInt((engineeringProjects.length / 2).floor());
    return SafeArea(
      child: Container(
        color: offOrange,
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: paddingWidth(context, 0.05),
            vertical: paddingHeight(context, 0.2)),
        width: gWidth(context, 1),
        height: gHeight(context, 1),
        child: Center(
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => BestProjectCard(
                  projectName:
                      engineeringProjects.keys.elementAt(randomIndex + index),
                  projectImgPath: bestProjectsImages[randomIndex + index],
                  onPressed: () {
                    navToWithoutReplace(
                        context: context,
                        nextPage: BestProjectPage(
                            projectName: engineeringProjects.keys
                                .elementAt(index + randomIndex),
                            projectDescription: engineeringProjects.values
                                .elementAt(index + randomIndex), projectImagePath: bestProjectsImages[index+randomIndex],));
                  }),
              separatorBuilder: (context, index) => SizedBox(
                    width: paddingWidth(context, 0.005),
                  ),
              itemCount: 4),
        ),
      ),
    );
  }
}
