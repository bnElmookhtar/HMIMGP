import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmimgp/src/btn_functions/navigation.dart';
import 'package:hmimgp/src/common_widgets/btn.dart';
import 'package:hmimgp/src/common_widgets/scaffold_msg.dart';
import 'package:hmimgp/src/common_widgets/txt_from_field.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/lengths/fonts_size.dart';
import 'package:hmimgp/src/constants/lengths/margines_paddings.dart';
import 'package:hmimgp/src/featcheres/on_boarding/screens/welcome.dart';
import '../../../../../common_widgets/user_profile_bar.dart';
import '../../../../../constants/strings/app_strings/register.dart';
import '../../../../../constants/strings/app_strings/user_profile.dart';
import '../controllers/delete_account_controller.dart';
import '../controllers/logout_controller.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final deleteAccountController = Get.put(DeleteAccountController());
    final logOutController = Get.put(LogOutController());
    TextEditingController editDescription = TextEditingController();
    return SafeArea(
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
            vertical: paddingHeight(context, 0.02),
            horizontal: paddingWidth(context, 0.01)),
        color:offOrange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UserProfileBar(
                username: currentUserUsername, email: currentUserEmail),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  description,
                  style: TextStyle(color: deepBlue,fontSize: medium),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                                title: Text(editAccountDescription),
                                content: GenericTextFormField(
                                  theirIsSuffixIcon: false,
                                  controller: editDescription,
                                  txtColor: white,
                                  maxLength: 200,
                                  label: editAccountDescription,
                                ),
                                actions: [
                                  Center(
                                    child: elevatedBtn(
                                        context: context,
                                        width: gWidth(context, 0.4),
                                        height: gHeight(context, 0.08),
                                        btnFunction: () {
                                          setState(() {
                                            userDesc =
                                                editDescription.text.toString();
                                            Navigator.pop(context);
                                          });
                                        },
                                        btnText: "Edit Description"),
                                  ),
                                ],
                              ));
                    },
                    icon: Icon(Icons.edit,color: deepBlue,size: medium,)),
              ],
            ),
            Text(
              userDesc,
              maxLines: 4,
              style: TextStyle(color: deepBlue,fontSize: small_1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                elevatedBtn(
                    context: context,
                    width: gWidth(context, 0.4),
                    height: gHeight(context, 0.1),
                    btnFunction: () {
                      showAdaptiveDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                                title: Text(
                                  deleteAccount,
                                  style:
                                      TextStyle(fontSize: 32, color: deepBlue),
                                ),
                                backgroundColor: offOrange,
                                actionsAlignment: MainAxisAlignment.spaceAround,
                                content: Text(deleteAccountWarning,
                                    style: TextStyle(
                                        fontSize: 32, color: offBlue)),
                                actions: [
                                  elevatedBtn(
                                      context: context,
                                      width: gWidth(context, 0.2),
                                      height: gHeight(context, 0.1),
                                      btnFunction: () async {
                                        //TODO  logic err here
                                        //the if condigion must be successSignUpMSg == msg but it work if we change condition to !=

                                        String msg =
                                            await deleteAccountController
                                                .deleteCurrentAccount();
                                        if (successSignUpMSg != msg ||
                                            msg.isEmpty) {
                                          scaffoldMsg(
                                              msg: msg, context: context);
                                          navToWithReplace(
                                              context: context,
                                              nextPage: Welcome());
                                        } else if (errWhenDeletingAccount
                                            .contains(msg)) {
                                          scaffoldMsg(
                                              msg: msg, context: context);
                                          Navigator.pop(context);
                                        }
                                      },
                                      btnText: delete.toUpperCase(),
                                      btnColor: red),
                                  elevatedBtn(
                                      context: context,
                                      width: gWidth(context, 0.2),
                                      height: gHeight(context, 0.1),
                                      btnFunction: () {
                                        Navigator.pop(context);
                                      },
                                      btnText: back.toUpperCase()),
                                ],
                              ));
                    },
                    btnText: deleteAccount),
                elevatedBtn(
                    context: context,
                    width: gWidth(context, 0.4),
                    height: gHeight(context, 0.1),
                    btnFunction: () {
                      showAdaptiveDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                                title: Text(
                                  logout,
                                  style:
                                      TextStyle(fontSize: 32, color: deepBlue),
                                ),
                                backgroundColor: offOrange,
                                actionsAlignment: MainAxisAlignment.spaceAround,
                                content: Text(logoutAccountWarning,
                                    style: TextStyle(
                                        fontSize: 32, color: offBlue)),
                                actions: [
                                  elevatedBtn(
                                      context: context,
                                      width: gWidth(context, 0.2),
                                      height: gHeight(context, 0.1),
                                      btnFunction: () async {
                                        await logOutController.logOut();
                                        navToWithReplace(
                                            context: context,
                                            nextPage: Welcome());
                                      },
                                      btnText: logout.toUpperCase(),
                                      btnColor: red),
                                  elevatedBtn(
                                      context: context,
                                      width: gWidth(context, 0.2),
                                      height: gHeight(context, 0.1),
                                      btnFunction: () {
                                        Navigator.pop(context);
                                      },
                                      btnText: back.toUpperCase()),
                                ],
                              ));
                    },
                    btnText: logout),
              ],
            )
          ],
        ),
      ),
    );
  }
}
