import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paytr_case/app_constant/app_constant.dart';
import 'package:paytr_case/app_provider/app_provider.dart';
import 'package:paytr_case/shared/functions.dart';
import 'package:paytr_case/view/countries_view/widget/country_list_item.dart';
import 'package:paytr_case/view_model/countries_view_model.dart';
import 'package:paytr_case/widget/app/app_loading_widget.dart';
import 'package:paytr_case/widget/form/textFormField_with_radius.dart';

class CountryDetailView extends StatefulWidget {
  final String name;
  final double value;
  CountryDetailView(this.name, this.value, {super.key});

  @override
  State<CountryDetailView> createState() => _CountryDetailViewState();
}

class _CountryDetailViewState extends State<CountryDetailView> {
  final TextEditingController crtl = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return AppProvider<CountriesViewModel>(onReady: (provider) async {
      await provider.getCountries();
    }, builder: (context, provider, _) {
      return GestureDetector(
        onTap: () {
          hideKeyboard();
        },
        child: Scaffold(
          appBar: AppBar(
              title: Text(
            widget.name,
          )),
          body: Padding(
            padding: horizontalPadding,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                AppTextFormField(
                  key: Key("changeField"),
                  controller: crtl,
                  hintText: "Değer Giriniz",
                  onChanged: (value) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                provider.isBusy
                    ? AppLoadingWidget()
                    : Expanded(
                        child: ListView.builder(
                            itemCount: provider.countries?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              String indexName = provider.countries!.data!.keys
                                  .toList()[index];
                              if (indexName == widget.name) return SizedBox();
                              double indexValue = provider
                                  .countries!.data!.values
                                  .toList()[index]
                                  .toDouble();
                              return CountryListItem(
                                  withTap: false,
                                  name: indexName,
                                  value: provider.changeCurrency(
                                      value: double.tryParse(
                                              crtl.text.isNotEmpty
                                                  ? crtl.text
                                                  : "0") ??
                                          0,
                                      from: widget.value,
                                      to: indexValue));
                            }),
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}
