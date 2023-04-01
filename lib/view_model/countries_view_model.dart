import 'package:paytr_case/app_provider/app_provider_model.dart';
import 'package:paytr_case/enums.dart';
import 'package:paytr_case/model/countries/countries.dart';
import 'package:paytr_case/service/network_manager.dart';
import 'package:paytr_case/shared/functions.dart';

class CountriesViewModel extends BaseModel {
  Countries? countries;
  getCountries() async {
    try {
      if (countries != null) return;
      setViewState(ViewState.Busy);
      var response = await NetworkManager.instance.dio.get(
          "https://api.freecurrencyapi.com/v1/latest?apikey=gVJrn2XeCXDAlZ5W10N27GA1PK8VUHihYnFscmOS");
      countries = Countries.fromJson(responseToMap(response));
      setViewState(ViewState.Idle);
    } catch (e) {
      setViewState(ViewState.Error);
    }
  }

  double changeCurrency(
      {required double value, required double from, required double to}) {
    return (value * to) / from;
  }


}
