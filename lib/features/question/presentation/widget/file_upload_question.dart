// ignore_for_file: library_private_types_in_public_api
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../provider/resault_provider.dart';

class FileUploadQuestion extends StatefulWidget {
  final String question;
  final int qustionId;
  const FileUploadQuestion(
      {super.key, required this.question, required this.qustionId});

  @override
  _FileUploadQuestionState createState() => _FileUploadQuestionState();
}

class _FileUploadQuestionState extends State<FileUploadQuestion> {
  ValueNotifier<PlatformFile?> _filePath = ValueNotifier<PlatformFile?>(null);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResaultProvider resaultProvider =
        Provider.of<ResaultProvider>(context, listen: false);
    Map<int, dynamic> savedFile =
        resaultProvider.findResautWithKey(widget.qustionId);
    if (savedFile.isNotEmpty) {
      PlatformFile file = savedFile[widget.qustionId] as PlatformFile;
      _filePath.value = file;
      log(file.path.toString());
    }
    return Padding(
      padding: EdgeInsets.all(25.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.question,
            style: TextFontStyle.headline20w400C141414StyleInter,
          ),
          UIHelper.verticalSpace(30.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.cF4F5F7,
            ),
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 50.w),
            child: GestureDetector(
              onTap: () => _showFilePickerDialog(
                  context), // Show file picker dialog on tap
              child: ValueListenableBuilder<PlatformFile?>(
                valueListenable: _filePath,
                builder: (context, file, _) {
                  log('File Path : $_filePath');
                  if (file != null) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Assets.icons.uploadIcon.path,
                          width: 40.w,
                        ),
                        UIHelper.verticalSpace(10.h),
                        Text(
                          file.name, // Display file name
                          style: TextFontStyle.headline16w400C848484StyleInter,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Assets.icons.uploadIcon.path,
                          width: 40.w,
                        ),
                        UIHelper.verticalSpace(10.h),
                        Text(
                          'Upload File', // Default text before file is selected
                          style: TextFontStyle.headline16w400C848484StyleInter,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilePickerDialog(BuildContext context) async {
    ResaultProvider resaultProvider =
        Provider.of<ResaultProvider>(context, listen: false);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'pdf',
        'doc',
        'docx',
        'xlsx',
        'pptx'
      ],
    );

    if (result != null) {
      PlatformFile file = result.files.single;
      _filePath.value = file;
      resaultProvider.removeByKey(widget.qustionId);
      resaultProvider.addAnswer({widget.qustionId: file});
      log('File Path : ${_filePath.value!.path}');
    } else {
      log('No file selected.');
    }
  }
}
