import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../common_widgets/auth_button.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_text_feild.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';

class ExperianceEditScreen extends StatefulWidget {
  final String? crntCompanyName;
  final String? designation;
  final String? employeetype;
  final String? startDate;
  final String? endDate;
  final String? jobLocation;
  final int id;
  const ExperianceEditScreen({
    super.key,
    this.crntCompanyName,
    this.designation,
    this.employeetype,
    this.startDate,
    this.endDate,
    this.jobLocation,
    required this.id,
  });

  @override
  State<ExperianceEditScreen> createState() => _ExperianceEditScreenState();
}

class _ExperianceEditScreenState extends State<ExperianceEditScreen> {
  final _companyName = TextEditingController();
  final _designation = TextEditingController();
  final _employeeType = TextEditingController();
  final _endDate = TextEditingController();
  final _startDate = TextEditingController();
  final _jobLocation = TextEditingController();
  String? _endDatePicked;
  String? _startDatePicked;
  int? id;

  @override
  void initState() {
    _companyName.text = widget.crntCompanyName ?? '';
    _designation.text = widget.designation ?? '';
    _startDatePicked = widget.startDate ?? '';
    _endDatePicked = widget.endDate ?? '';
    _employeeType.text = widget.employeetype ?? '';
    _jobLocation.text = widget.jobLocation ?? '';
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75.h,
          elevation: 0,
          backgroundColor: AppColors.cffffff,
          leading: GestureDetector(
            onTap: () {
              NavigationService.goBack();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.c000000,
            ),
          ),
          title: Text(
            'Edit Experiences',
            style: TextFontStyle.headline20w600C141414StyleInter,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(25.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Company Name',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _companyName,
                  isPrefixIcon: false,
                  hintText: 'Xbox',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Designation',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _designation,
                  isPrefixIcon: false,
                  hintText: 'Abc Category',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Employee Type',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _employeeType,
                  isPrefixIcon: false,
                  hintText: 'Abc Category',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Start Date',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  readOnly: true,
                  suffixIcon: Icons.calendar_month,
                  onSuffixIconTap: () {
                    _selectDate(context, (selectedDate) {
                      setState(() {
                        _startDatePicked = selectedDate;
                      });
                    });
                  },
                  maxline: 1,
                  controller: TextEditingController(text: _startDatePicked),
                  isPrefixIcon: false,
                  hintText: 'Currently Working Here',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'End Date',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  readOnly: true,
                  suffixIcon: Icons.calendar_month,
                  onSuffixIconTap: () {
                    _selectDate(context, (selectedDate) {
                      setState(() {
                        _endDatePicked = selectedDate;
                      });
                    });
                  },
                  maxline: 1,
                  controller: TextEditingController(text: _endDatePicked),
                  isPrefixIcon: false,
                  hintText: 'Currently Working Here',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Job Location',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _jobLocation,
                  isPrefixIcon: false,
                  hintText: 'Location',
                ),
                UIHelper.verticalSpace(30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AuthCustomeButton(
                      name: 'Update',
                      onCallBack: () {
                        postExperianceEdit.postExperiance(
                            _companyName.text,
                            _designation.text,
                            _startDatePicked.toString(),
                            _endDatePicked.toString(),
                            _jobLocation.text,
                            widget.id);
                      },
                      height: 50.h,
                      minWidth: 150.w,
                      borderRadius: 25.r,
                      color: AppColors.allPrimaryColor,
                      textStyle: TextFontStyle.headline14w600C141414StyleInter
                          .copyWith(color: AppColors.cffffff),
                      context: context,
                    ),
                    AuthCustomeButton(
                      name: 'Delete',
                      onCallBack: () {
                        _showAlertDialog(context);
                      },
                      height: 50.h,
                      minWidth: 150.w,
                      borderRadius: 25.r,
                      color: AppColors.cFF5630,
                      textStyle: TextFontStyle.headline14w600C141414StyleInter
                          .copyWith(color: AppColors.cffffff),
                      context: context,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _companyName.dispose();
    _designation.dispose();
    _employeeType.dispose();
    _endDate.dispose();
    _startDate.dispose();
    _jobLocation.dispose();
    super.dispose();
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Experiance?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customeButton(
                  borderRadius: 17.r,
                  color: AppColors.cffffff,
                  context: context,
                  height: 30.h,
                  minWidth: 70.w,
                  name: 'No',
                  onCallBack: () {
                    NavigationService.goBack;
                  },
                  textStyle: TextFontStyle.headline14w600C141414StyleInter,
                  borderColor: AppColors.allPrimaryColor,
                ),
                customeButton(
                  borderRadius: 17.r,
                  color: AppColors.allPrimaryColor,
                  context: context,
                  height: 30.h,
                  minWidth: 70.w,
                  name: 'Yes',
                  onCallBack: () {
                    postDeleterExperiance.postDeleterExperiance(widget.id).then(
                        (value) => NavigationService.navigateToReplacement(
                            Routes.profile));
                  },
                  textStyle: TextFontStyle.headline14w600C141414StyleInter
                      .copyWith(color: AppColors.cffffff),
                  borderColor: AppColors.allPrimaryColor,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> _selectDate(
      BuildContext context, Function(String) onDatePicked) async {
    final DateTime? picked = await showDatePicker(
      barrierDismissible: false,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      onDatePicked(formatDateTime(picked));
    }
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
