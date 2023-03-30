import 'package:flutter/material.dart';
import 'package:paytr_case/app_constant/app_colors.dart';
import 'package:paytr_case/app_constant/app_constant.dart';
import 'package:paytr_case/app_provider/app_provider.dart';
import 'package:paytr_case/router/app_router.dart';
import 'package:paytr_case/service/hive_manager.dart';
import 'package:paytr_case/view/sign_in_view.dart';
import 'package:paytr_case/view_model/auth_view_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider<AuthViewModel>(
      onReady: (provider) async {
       await  Future.delayed(Duration(seconds: 2));
        if (HiveManager.isAuth()) {
          provider.getCurrenUser();
        }else{
          AppRouter.normalNavigate(SignInView());
        }
      },
      builder: (context, provider, child) {
          return Scaffold(
            body: Center(child: Image.asset("assets/welcome.png",fit: BoxFit.cover,width: screenWidth-100,)),
          );
      
      },
    );
  }
}
