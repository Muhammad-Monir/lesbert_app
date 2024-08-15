// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class MyCustomDropdown extends StatefulWidget {
  final String? selectedValue;
  final List<String> dropDownValue;
  final Function(String?)? onTap;
  final double horizonPadding;
  final double verticPadding;
  final String? hinttext;

  const MyCustomDropdown({
    super.key,
    required this.selectedValue,
    required this.dropDownValue,
    this.horizonPadding = 2,
    this.verticPadding = 0,
    this.hinttext,
    this.onTap,
  });

  @override
  _MyCustomDropdownState createState() => _MyCustomDropdownState();
}

class _MyCustomDropdownState extends State<MyCustomDropdown> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode;
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Focus(
        focusNode: _focusNode,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: widget.horizonPadding.w,
              vertical: widget.verticPadding),
          decoration: BoxDecoration(
            color: AppColors.cF4F5F7,
            border: Border.all(
              color: _focusNode.hasFocus
                  ? AppColors.allPrimaryColor
                  : Colors.transparent,
              width: 1.w,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text(
                "${widget.hinttext}",
                style: TextFontStyle.headline16w400C848484StyleInter,
              ),
              isExpanded: true,
              value: widget.selectedValue,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 22.sp,
              ),
              items: widget.dropDownValue
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                widget.onTap?.call(newValue);
                FocusScope.of(context).requestFocus(_focusNode);
              },
              dropdownColor: AppColors.cffffff,
            ),
          ),
        ),
      ),
    );
  }
}
