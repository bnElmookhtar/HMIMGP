import 'dart:convert';

import 'package:hmimgp/src/common_widgets/scaffold_msg.dart';
import 'package:hmimgp/src/featcheres/home_layout/screens/ideas/show_department_projects_ideas.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hmimgp/src/btn_functions/navigation.dart';
import 'package:hmimgp/src/common_widgets/btn.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/lengths/fonts_size.dart';
import '../../../../constants/lengths/margines_paddings.dart';
import '../../../../constants/strings/app_strings/home_layout.dart';

class Ideas extends StatefulWidget {
  const Ideas({super.key});

  @override
  State<Ideas> createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  late final String responseMessage ;
  final String apiKey = openAiKey; // Replace with your OpenAI API key
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
              selectDepartment,
              style: TextStyle(color: deepBlue, fontSize: medium),
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
                          btnFunction: () async{
                            scaffoldMsg(msg: waitePreparingResponse, context: context);
                            await sendMessage("Give me 10 ideas for graduation project in engineering in ${engineeringDepartments[index]}");
                            navToWithoutReplace(
                              context: context,
                              nextPage: ShowIdeas(
                                  departmentName:
                                  engineeringDepartments[index], ideas: responseMessage,
                              ),
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

  Future<void> sendMessage(String message) async {


    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant.'},
          {'role': 'user', 'content': message},
        ],
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String reply = data['choices'][0]['message']['content'];
      setState(() {
        responseMessage = reply;

      });
    } else {
      setState(() {
        responseMessage = 'Error communicating with ChatGPT';
      });
    }
  }
}
