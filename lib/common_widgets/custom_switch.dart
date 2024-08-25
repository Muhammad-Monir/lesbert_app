// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/constants/text_font_style.dart';
import 'package:lsebert/gen/colors.gen.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _circleAnimation;
  bool isFirstCircleVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
        widget.onChanged(!widget.value);
        setState(() {
          isFirstCircleVisible = !isFirstCircleVisible;
        });
      },
      child: Container(
        width: .5.sw,
        height: .04.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.allPrimaryColor,
        ),
        child: Stack(
          children: [
            Align(
              alignment: _circleAnimation.value,
              child: Container(
                  alignment: widget.value
                      ? ((Directionality.of(context) == TextDirection.rtl)
                          ? Alignment.centerLeft
                          : Alignment.centerRight)
                      : ((Directionality.of(context) == TextDirection.rtl)
                          ? Alignment.centerRight
                          : Alignment.centerLeft),
                  child: Container(
                    width: .28.sw,
                    height: .035.sh,
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.allPrimaryColor,
                    ),
                    child: Container(
                      // width: .25.sw,
                      // height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.cffffff,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          widget.value ? "Resolved" : "Pending",
                          style: TextFontStyle.headline14w400C848484StyleInter
                              .copyWith(
                            color: AppColors.allPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            if (widget.value)
              Positioned(
                  left: 20,
                  top: 10,
                  child: Text("Pending",
                      style: TextFontStyle.headline14w400C848484StyleInter
                          .copyWith(color: AppColors.cffffff))),
            if (!widget.value)
              Positioned(
                  right: 20,
                  top: 10,
                  child: Text("Resolved",
                      style: TextFontStyle.headline14w400C848484StyleInter
                          .copyWith(color: AppColors.cffffff))),
            //Text("Resolved")
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
