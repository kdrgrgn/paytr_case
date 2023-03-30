import 'package:hive/hive.dart';
import 'package:paytr_case/app_constant/app_constant.dart';
import 'package:paytr_case/app_provider/app_provider_model.dart';
import 'package:paytr_case/components/app_dialog.dart';
import 'package:paytr_case/enums.dart';
import 'package:paytr_case/landing_page.dart';
import 'package:paytr_case/model/user/user.dart';
import 'package:paytr_case/router/app_router.dart';
import 'package:paytr_case/service/hive_manager.dart';
import 'package:paytr_case/service/local_data_manager.dart';
import 'package:paytr_case/view/countries_view/country_list_view.dart';

class AuthViewModel extends BaseModel {
  User? user;
  signin({required String userName, required String password}) async {
    try {
      setViewState2(ViewState.Busy);
      Map<String, dynamic>? data = await LocalDataManager.getJsonAsset();
      if (data![userName]["password"] == password) {
        user = User.fromJson(data[userName]);
        HiveManager.setAuth(userName, password);

        AppRouter.navigateAndReplace(CountryListView());
      } else {
        AppDialog.show(
            content: "Lütfen doğru bilgileri girdiğinizden emin olun",
            title: "Hata");
      }
    } catch (e) {
      AppDialog.show(
          content: "Lütfen doğru bilgileri girdiğinizden emin olun",
          title: "Hata");
    } finally {
      setViewState2(ViewState.Idle);
    }
  }

  getCurrenUser() async {
    try {
      setViewState(ViewState.Busy);
      Map<String, dynamic>? data = await LocalDataManager.getJsonAsset();
      user = User.fromJson(data![HiveManager.getUserName()]);

      AppRouter.navigateAndReplace(CountryListView());
    } catch (e) {
      HiveManager.clearAuth();
      user = null;
      AppRouter.navigateAndRemoveUntil(LandingPage());
      AppDialog.show(
          content: "Lütfen doğru bilgileri girdiğinizden emin olun",
          title: "Hata");
    } finally {
      setViewState(ViewState.Idle);
    }
  }
}
