import 'package:flutter/material.dart';
import 'package:paytr_case/app_provider/app_provider.dart';
import 'package:paytr_case/components/error_page_view.dart';
import 'package:paytr_case/router/app_router.dart';
import 'package:paytr_case/view/countries_view/country_detail_view.dart';
import 'package:paytr_case/view/countries_view/widget/country_list_item.dart';
import 'package:paytr_case/view_model/countries_view_model.dart';
import 'package:paytr_case/widget/app/app_loading_widget.dart';

class CountryListView extends StatelessWidget {
  const CountryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ülkeler"),
      ),
      body: AppProvider<CountriesViewModel>(onReady: (provider) {
        provider.getCountries();
      }, builder: (context, provider, _) {
        if (provider.isBusy) return AppLoadingWidget();
        if (provider.isError)
          return ErrorPageView(
            onRefresh: () {
              provider.getCountries();
            },
          );

        return ListView.builder(
            itemCount: provider.countries?.data?.length ?? 0,
            itemBuilder: (context, index) {
              String name = provider.countries!.data!.keys.toList()[index];
              double value = provider.countries!.data!.values.toList()[index].toDouble();
              return CountryListItem(name: name, value: value);
            });
      }),
    );
  }
}
