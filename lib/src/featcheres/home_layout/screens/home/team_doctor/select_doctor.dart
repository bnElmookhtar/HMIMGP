import 'package:flutter/material.dart';
import 'package:hmimgp/src/common_widgets/scaffold_msg.dart';
import 'package:hmimgp/src/constants/strings/app_strings/user_profile.dart';
import 'package:hmimgp/src/featcheres/home_layout/screens/home/team_doctor/email_provider.dart';
import '../../../../../common_widgets/btn.dart';
import '../../../../../common_widgets/txt_filed.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/lengths/fonts_size.dart';
import '../../../../../constants/lengths/margines_paddings.dart';
import '../../../../../constants/strings/app_strings/home_layout.dart';
import '../../../../../constants/strings/app_strings/select_doctor.dart';

class SelectDoctor extends StatefulWidget {
  const SelectDoctor({super.key, required this.departmentName});
  final String departmentName;

  @override
  State<SelectDoctor> createState() => _SelectDoctorState();
}

class _SelectDoctorState extends State<SelectDoctor> {
  List<String> users = [
    'karimmotar17@gmail.com',
    'ahmed@gmail.com',
    'yasser1@gmail.com',
    'karimmotar17@gmail.com',
    'omer46@gmail.com',
    'tamer55@gmail.com',
    'mohameddd@gmail.com',
    'tagreeda@gmail.com',
    'fatmaeww@gmail.com',
    'nader@gmail.com',
    'kemo1@gmail.com',
    'karimmm@gmail.com',
    'karimmotar88@gmail.com',
    'krimm45@gmail.com',
    'ahmedmo14@gmail.com',
    'ezzat14@gmail.com',
  ];
  List<String> searchResults = [];
  List<String> teamDoctorEmails = [];

  TextEditingController descriptionController = TextEditingController();
  TextEditingController receiverController = TextEditingController();

  bool isSearchBarVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.departmentName),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                descriptionController.text = "";
                receiverController.text = "";
                teamDoctorEmails.removeRange(0, teamDoctorEmails.length);
                Navigator.pop(context);
              }),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: gWidth(context, 1),
              height: gHeight(context, 0.1),
              child: Text(
                selectDoctorPhrase,
                style: TextStyle(
                  color: white,
                  fontSize: small_1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: gWidth(context, 1),
              height: gHeight(context, 0.7),
              padding: EdgeInsets.only(
                  top: paddingHeight(context, 0.002),
                  left: paddingWidth(context, 0.002),
                  right: paddingWidth(context, 0.002)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: paddingWidth(context, 0.02)),
                    width: gWidth(context, 0.6),
                    height: gHeight(context, 0.7),
                    decoration: BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: gWidth(context, 0.6),
                          height: gHeight(context, 0.1),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: gWidth(context, 0.5),
                                  height: gHeight(context, 0.1),
                                  child: TextField(
                                    onChanged: (query) {
                                      setState(() {
                                        searchResults = users
                                            .where((item) => item
                                                .toLowerCase()
                                                .contains(query.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                    style: TextStyle(color: deepBlue),
                                    decoration: InputDecoration(
                                        hintText: selectTeamMember,
                                        hintStyle: TextStyle(color: deepBlue),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide:
                                              BorderSide(color: deepBlue),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        )),
                                    enabled: isSearchBarVisible ? true : false,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSearchBarVisible = true;
                                  });
                                },
                                icon: Icon(Icons.add),
                                color: deepBlue,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: gWidth(context, 0.6),
                          height: gHeight(context, 0.58),
                          child: ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              return index % 2 == 0
                                  ? elevatedBtn(
                                      context: context,
                                      width: gWidth(context, 0.4),
                                      height: gHeight(context, 0.05),
                                      btnFunction: () {
                                        addNewEmailToList(searchResults[index]);
                                      },
                                      btnText: searchResults[index],
                                      fontSize: small_2)
                                  : const Divider();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: gWidth(context, 0.35),
                    height: gHeight(context, 0.7),
                    decoration: BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: txtField(
                        hint: describeProject,
                        controller: descriptionController),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: paddingWidth(context, 0.02),
                vertical: paddingHeight(context, 0.01),
              ),
              child: elevatedBtn(
                  context: context,
                  width: gWidth(context, 0.96),
                  height: gHeight(context, 0.1),
                  btnFunction: () {
                    if (descriptionController.text.toString().isEmpty)
                      return scaffoldMsg(
                          msg: describeProject, context: context);

                    if (teamDoctorEmails.length < 6)
                      return scaffoldMsg(
                          msg: teamMembersNumber, context: context);

                    showDialog(
                      context: context,
                      builder: (builder) => Center(
                        child: AlertDialog(
                          title: Center(
                              child: Text(
                            teamMembers,
                            style: TextStyle(fontSize: medium),
                          )),
                          backgroundColor: deepBlue,
                          content: Column(
                            children: List.generate(
                              teamDoctorEmails.length,
                              (index) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(teamDoctorEmails[index]),
                                  Text(index == 0 ? monitor : member),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            elevatedBtn(
                                context: context,
                                width: gWidth(context, 0.3),
                                height: gHeight(context, 0.1),
                                btnFunction: () {
                                  Navigator.pop(context);
                                },
                                btnText: back,
                                fontSize: small_2),
                            elevatedBtn(
                                context: context,
                                width: gWidth(context, 0.3),
                                height: gHeight(context, 0.1),
                                btnFunction: () async {
                                  receiverController.text = teamDoctorEmails[0];
                                  sendEmail(
                                      descriptionController.text.toString(),
                                      receiverController.text.toString());
                                  Navigator.pop(context);
                                },
                                btnText: send,
                                fontSize: small_2),
                          ],
                        ),
                      ),
                    );
                  },
                  btnText: "SUBMIT"),
            ),
          ],
        ));
  }

  addNewEmailToList(String email) {
    setState(() {
      teamDoctorEmails.add(email);
      receiverController.text = "";
      scaffoldMsg(
          msg: "Adding $email member to the team successfully ",
          closeIcon: true,
          duration: 250,
          context: context);
    });
  }
}
