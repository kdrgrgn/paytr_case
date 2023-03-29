import 'package:flutter/material.dart';
import 'package:paytr_case/router/app_router.dart';
import 'package:paytr_case/view/countries_view/country_detail_view.dart';

class CountryListItem extends StatelessWidget {
  final String name;
  final double value;
 final  bool withTap;
  const CountryListItem({required this.name,required this.value, this.withTap=true, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:!withTap?null: () {
        AppRouter.normalNavigate(CountryDetailView(name,value));
      },
      title: Text(name),
      subtitle: Text(value.toString()),
      trailing:withTap? Icon(Icons.arrow_forward_ios):null,
    );
    ;
  }
}
