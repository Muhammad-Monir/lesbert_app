// ignore_for_file: library_private_types_in_public_api, unused_field
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';
import '../../../provider/resault_provider.dart';
import 'widget/check_box_question.dart';
import 'widget/file_upload_question.dart';
import 'widget/polar_question.dart';
import 'widget/radio_question.dart';
import 'widget/text_area_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isFirsatBuild = true;

  final _detailsController1 = TextEditingController();
  final _detailsController2 = TextEditingController();
  List<dynamic> questions = [];

  int currentStep = 0;
  dynamic question = "";
  String currentQustion = "";
  String questionType = "";
  double progressValue = 0;
  int totalSteps = 0;
  int qustionId = 0;

  List<String> items1 = [
    'Full-Time',
    'Part-Time',
    'Project-Based',
    'Temporary',
    'Not Sure'
  ];
  List<String> items2 = ['Option A', 'Option B', 'Option C', 'Option D'];
  int selectValue1 = -1;
  int selectValue2 = -1;

  final List<String> titles = [
    'Full-Time',
    'Part-Time',
    'Project-Based',
    'Temporary',
    'Not Sure',
    'Freelance',
    'Internship',
    'Contract',
    'Seasonal',
    'Volunteer'
  ];

  // _QuestionScreenState() : isCheckedList = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentStep == 0
          ? null
          : AppBar(
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentStep > 0) {
                      currentStep -= 1;
                      progressValue = currentStep / totalSteps;
                    }
                  });
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24.sp,
                  color: AppColors.c000000,
                ),
              ),
              elevation: 0,
              backgroundColor: AppColors.cffffff,
              title: Text(
                'Back To Previous Page',
                style: TextFontStyle.headline18w700C22252DStyleInter,
              ),
            ),
      body: SizedBox(
        height: 900,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.sp),
            child: StreamBuilder(
              stream: getQuestionRx.dataFetcher,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (isFirsatBuild) {
                    Map? data = snapshot.data;
                    questions = data!["data"]["questions"];
                    totalSteps = questions.length - 1;
                    currentQustion = questions[currentStep]["question_text"];
                    questionType = questions[currentStep]["type"] == "radio"
                        ? questions[currentStep]["options"].length == 2
                            ? "polar"
                            : "radio"
                        : "radio";
                    isFirsatBuild = false;
                    qustionId = questions[currentStep]["id"];
                  }

                  // for (var i = 0; i < questions.length; i++) {
                  //   log(questions[i]["type"]);

                  //   // if (questions[i]["type"] == "radio") {
                  //   //   List<dynamic> option = questions[i]["options"];
                  //   //   if (option.length == 2) {
                  //   //     log("polar");
                  //   //     // _getStepContent("polar", questions[i]["question_text"]);
                  //   //   } else {
                  //   //     //    _getStepContent(questions[i]["type"],
                  //   //     //   questions[i]["question_text"]);
                  //   //     log("radio");
                  //   //   }
                  //   // } else {
                  //   //   //   _getStepContent(
                  //   //   //  questions[i]["type"], questions[i]["question_text"]);
                  //   // }
                  // }
                  log("${questions.length}  No of questions");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (currentStep == 0) ...[
                        UIHelper.verticalSpace(50.w),
                        Text(
                          textAlign: TextAlign.center,
                          'Go through these phases\n to complete the profile\n building process.',
                          style: TextFontStyle.headline24w700C000000StyleInter,
                        ),
                      ],
                      UIHelper.verticalSpace(50.h),
                      // Progress Bar
                      SizedBox(
                        height: 50.h, // Ensure it has a fixed height
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.centerLeft,
                          children: [
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 10),
                                overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 15),
                              ),
                              child: Slider(
                                thumbColor: AppColors.allPrimaryColor,
                                value: progressValue,
                                onChanged: (newValue) {
                                  // Prevent slider interaction if you only want it to update via the Next button
                                },
                                min: 0.0,
                                max: 1.0,
                                activeColor: AppColors.allPrimaryColor,
                                inactiveColor: AppColors.cB3BAC5,
                              ),
                            ),
                            Positioned(
                              top: 40.h,
                              left: progressValue *
                                  (MediaQuery.of(context).size.width -
                                      32.w -
                                      28.w), // Adjust for padding and thumb size
                              child: Text(
                                "${(progressValue * 100).round()}%",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _getStepContent()
                    ],
                  );
                } else {
                  return SizedBox(
                    height: .8.sh,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          left: 35.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentStep > 0) {
                      currentStep -= 1;
                      question = questions[currentStep];
                      currentQustion = questions[currentStep]["question_text"];
                      questionType = questions[currentStep]["type"] == "radio"
                          ? questions[currentStep]["options"].length == 2
                              ? "polar"
                              : "radio"
                          : questions[currentStep]["type"];
                      progressValue = currentStep / totalSteps;
                      qustionId = questions[currentStep]["id"];
                    }
                  });
                },
                child: Text(
                  currentStep > 0 ? 'Previous' : "",
                  style: TextFontStyle.headline20w600C141414StyleInter,
                )),
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentStep < totalSteps) {
                      currentStep += 1;
                      question = questions[currentStep];
                      currentQustion = questions[currentStep]["question_text"];
                      questionType = questions[currentStep]["type"] == "radio"
                          ? questions[currentStep]["options"].length == 2
                              ? "polar"
                              : "radio"
                          : questions[currentStep]["type"];
                      progressValue = currentStep / totalSteps;
                      qustionId = questions[currentStep]["id"];
                    } else {
                      log("here");
                      // setState(() {
                      //   currentStep = 0;
                      //   progressValue = 0;
                      //   questionType = "none";
                      // });
                      log(context.read<ResaultProvider>().answers.toString());
                      postQuestionRxObj.postQuestionData(
                          context.read<ResaultProvider>().answers);
                      // Future.delayed(Duration(milliseconds: 500)).then(
                      //   (value) {
                      //     NavigationService.navigateToReplacement(
                      //         Routes.loading);
                      //   },
                      // );

                      // Handle when the last step is reached, e.g., navigate to another screen
                    }
                  });
                },
                child: Text(
                  currentStep < totalSteps ? "Next" : "Finish",
                  style: TextFontStyle.headline20w600C141414StyleInter,
                )),
          ],
        ),
      ),
    );
  }

  Widget _getStepContent() {
    switch (questionType) {
      case "polar":
        return PolarQuestion(
          question: currentQustion,
          qustionId: qustionId,
        );
      case "file":
        return FileUploadQuestion(
            question: currentQustion, qustionId: qustionId);
      case "radio":
        List<String> data = [];
        List<dynamic> options = question["options"];
        for (var element in options) {
          data.add(element["option_text"]);
        }
        return RadioQuestion(
          qustionId: qustionId,
          items1: data,
          question: currentQustion,
        );
      case "checkbox":
        List<String> data = [];
        List<dynamic> options = question["options"];
        for (var element in options) {
          data.add(element["option_text"]);
        }
        Map savedMap =
            context.read<ResaultProvider>().findResautWithKey(qustionId);
        context.read<ResaultProvider>().isCheckedList =
            List.generate(data.length, (index) => false);
        if (savedMap.isNotEmpty) {
          log(savedMap.toString());

          for (var innerMap in savedMap[qustionId]!) {
            // Iterate over the key-value pairs in each inner map
            innerMap.forEach((key, value) {
              context.read<ResaultProvider>().isCheckedList[key] = true;
            });
          }
        }
        return CheckBoxQuestion(
          qustionId: qustionId,
          question: currentQustion,
          title: data,
          onChanged: (value) {
            setState(() {
              log(value!);
              final index = data.indexOf(value);
              if (index != -1) {
                //    isCheckedList[index] = !isCheckedList[index];
              }
            });
          },
        );
      case "textarea":
        return TextAreaQuestion(
          qustionId: qustionId,
          question: currentQustion,
        );
      default:
        return SizedBox(
            height: .6.sh, child: const Center(child: Text('Completed')));
    }
  }
}
