import 'package:flutter/material.dart';
import 'package:hmimgp/src/btn_functions/navigation.dart';
import 'package:hmimgp/src/common_widgets/btn.dart';
import 'package:hmimgp/src/featcheres/home_layout/screens/home/team_doctor/select_doctor.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/lengths/fonts_size.dart';
import '../../../../constants/lengths/margines_paddings.dart';
import '../../../../constants/strings/app_strings/home_layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: offOrange,
        width: gWidth(context, 1),
        height: gHeight(context, 1),
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: paddingWidth(context, 0.01)),
        child: Column(
          children: [
            Text(
              headerTxt,
              style: TextStyle(color: deepBlue, fontSize: medium),
            ),
            Text(
              headerSubtitle,
              style: TextStyle(color: deepBlue, fontSize: small_1),
            ),
            Spacer(),
            Container(
              height: gHeight(context, 0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (rowIndex) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (colIndex) {
                        // Calculate the index in the 1D list based on rowIndex and colIndex
                        int index = rowIndex * 3 + colIndex;

                        return elevatedBtn(
                          context: context,
                          width: gWidth(context, 0.3),
                          height: gHeight(context, 0.1),
                          btnFunction: () {
                            navToWithoutReplace(
                              context: context,
                              nextPage: SelectDoctor(
                                  departmentName:
                                      engineeringDepartments[index]),
                            );
                          },
                          btnText: engineeringDepartments[index],
                          btnColor: offBlue,
                          fontSize: 24,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
