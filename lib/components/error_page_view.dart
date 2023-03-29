import 'package:flutter/material.dart';
import 'package:paytr_case/app_constant/app_constant.dart';
import 'package:paytr_case/app_constant/text_styles.dart';


class ErrorPageView extends StatelessWidget {
  final Function onRefresh;
  const ErrorPageView({required this.onRefresh,super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: horizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                  const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.clear,
                  color: Colors.red,
                  size: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text("Bir Hata Oluştu",style: titleTextStyleLight.copyWith(fontSize: 25),),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      onRefresh();
                    },
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.grey,
                      size: 100,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
