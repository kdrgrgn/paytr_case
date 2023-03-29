
import 'package:flutter/material.dart';
import 'package:paytr_case/app_constant/text_styles.dart';
import 'package:paytr_case/main.dart';
import 'package:paytr_case/widget/app/app_button.dart';


class AppDialog {


  static Future<void> show({
    String? title,
    required String content,
    String? buttonOkText,
    String? buttonCancelText,
    Color backgroundColor = Colors.white,
    VoidCallback? onOkTap,
    VoidCallback? onCancelTap,
    bool barrierDismissible = true,
  }) async {
    await showDialog(
      barrierDismissible: barrierDismissible,
      context: appKey.currentContext!,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Center(child: Text(title,textAlign: TextAlign.center,style: titleTextStyle,)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                content,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (buttonCancelText != null)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppButton(
                        isSmall: true,
                        textStyle: whiteStyle,
                        onTap: () {
                          if (onCancelTap != null) onCancelTap();
                          Navigator.pop(appKey.currentContext!);
                        },
                        title: buttonCancelText,
                      ),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppButton(
                      isSmall: true,
                      textStyle: whiteStyle,
                      onTap: () {
                        if (onOkTap != null) onOkTap();
                        Navigator.pop(appKey.currentContext!);
                      },
                      title: buttonOkText ?? "Tamam",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
