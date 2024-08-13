import 'package:flutter/material.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../helpers/navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.centerTitle = true,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: centerTitle,
      leading: showBackButton
          ? IconButton(
              onPressed: () {
                NavigationService.goBack();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.c000000,
              ),
            )
          : null,
      title: Text(
        title,
        style: TextFontStyle.headline18w700C22252DStyleInter,
      ),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
