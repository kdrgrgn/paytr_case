import 'package:flutter/material.dart';
import 'package:paytr_case/app_constant/app_constant.dart';
import 'package:paytr_case/app_constant/text_styles.dart';
import 'package:paytr_case/app_provider/app_provider.dart';

import 'package:paytr_case/view_model/auth_view_model.dart';
import 'package:paytr_case/widget/app/app_button.dart';
import 'package:paytr_case/widget/form/textFormField_with_radius.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("signInScreen"),
      body: Padding(
        padding: horizontalPadding,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  "Hoş Geldiniz",
                  style: titleTextStyle,
                ),
                const SizedBox(
                  height: 100,
                ),
                AppTextFormField(
                  key: Key("userName"),
                  controller: nameCtrl,
                  validator: (value) {
                    if (value?.isEmpty ?? true) return "Boş Olamaz";
                    return null;
                  },
                  color: Colors.grey[200],
                  hintText: "Kullanıc adı",
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextFormField(
                  key: Key("password"),
                  controller: passwordCtrl,
                  validator: (value) {
                    if (value?.isEmpty ?? true) return "Boş Olamaz";
                    return null;
                  },
                  color: Colors.grey[200],
                  hintText: "Şifre",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 100,
                ),
                AppProvider<AuthViewModel>(builder: (context, provider, _) {
                  return AppButton(
                    key: Key("signin"),
                    isLoading: provider.isBusy2,
                    title: "Giriş Yap",
                    onTap: () {
                      if (!formKey.currentState!.validate()) return;
                      provider.signin(
                          userName: nameCtrl.text, password: passwordCtrl.text);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
