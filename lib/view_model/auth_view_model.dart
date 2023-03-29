import 'package:paytr_case/app_provider/app_provider_model.dart';
import 'package:paytr_case/enums.dart';
import 'package:paytr_case/model/user/user.dart';
import 'package:paytr_case/router/app_router.dart';
import 'package:paytr_case/service/local_data_manager.dart';
import 'package:paytr_case/view/countries_view/country_list_view.dart';

class AuthViewModel extends BaseModel {
  User? user;
  signin({required String userName, required String password}) async {
    try {
      setViewState(ViewState.Busy);
      await Future.delayed(Duration(seconds: 2));
      user = await LocalDataManager.getUser();
      AppRouter.navigateAndReplace(CountryListView());
      setViewState(ViewState.Idle);
    } catch (e) {
      setViewState(ViewState.Error);
    }
  }
}
