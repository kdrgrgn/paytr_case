
import 'package:flutter/material.dart';
import 'package:paytr_case/app_constant/app_colors.dart';
import 'package:paytr_case/app_constant/app_constant.dart';
import 'package:paytr_case/app_constant/text_styles.dart';
import 'package:paytr_case/widget/app/app_loading_widget.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? assetName;
  final Color? backgroundColor;
  final bool isLoading;
  final TextStyle? textStyle;
  final bool isSmall;
  final EdgeInsets? contentPadding;
  final bool withPadding;
  final double? width;
  final double elevation;

  const AppButton({
    Key? key,
    this.onTap,
    this.title = 'Button',
    this.assetName,
    this.backgroundColor = appDarkColor,
    this.isLoading = false,
    this.textStyle,
    this.contentPadding,
    this.isSmall = false,
    this.withPadding = true,
    this.width,
    this.elevation = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: withPadding ? horizontalPadding : EdgeInsets.zero,
      child: Material(
          color: onTap != null ? backgroundColor : Colors.grey,
          borderRadius: BorderRadius.circular(25),
          elevation: elevation,
          child: InkWell(
            onTap: isLoading ? null : onTap,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: width ?? (isSmall ? screenWidth / 2 : screenWidth),
              padding: contentPadding ??
                  EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: isSmall?5:15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   SizedBox(
                      width: 25,
                      height: 25,
                      child: isLoading
                          ? const AppLoadingWidget(
                              color: Colors.white,
                            )
                          : null),
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: textStyle ?? whiteStyle,
                    ),
                  ),
                  const SizedBox(width: 25, height: 25),
                ],
              ),
            ),
          )),
    );
  }
}
