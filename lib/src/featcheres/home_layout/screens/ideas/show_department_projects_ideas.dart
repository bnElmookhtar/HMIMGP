import 'package:flutter/material.dart';
import 'package:hmimgp/src/constants/lengths/fonts_size.dart';
import 'package:hmimgp/src/constants/strings/app_strings/home_layout.dart';
import '../../../../constants/colors.dart';

class ShowIdeas extends StatefulWidget {
  const ShowIdeas(
      {super.key, required this.departmentName, required this.ideas});
  final String departmentName;
  final String ideas;

  @override
  State<ShowIdeas> createState() => _ShowIdeasState();
}

class _ShowIdeasState extends State<ShowIdeas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        title: Text(widget.departmentName),
      ),
      body: ideas.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: SingleChildScrollView(
                child: Text(
                  widget.ideas,
                  style: TextStyle(color: deepBlue,fontSize: small_1),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
