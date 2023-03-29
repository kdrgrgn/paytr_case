
import 'package:flutter/material.dart';
import 'package:paytr_case/shared/functions.dart';
import 'package:provider/provider.dart';
import 'app_provider_model.dart';
import '../../locator.dart';

class AppProvider<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T provider, Widget? child) builder;
  final Function(T provider)? onReady;
  final Function(T provider)? onDispose;

  const AppProvider(
      {Key? key, required this.builder, this.onReady, this.onDispose})
      : super(key: key);

  @override
  _AppProviderState<T> createState() => _AppProviderState<T>();
}

class _AppProviderState<T extends BaseModel> extends State<AppProvider<T>> {
  T model = locator<T>();

  @override
  void initState() {


    addPostFrameCallback(() {
      if (widget.onReady != null) {
        widget.onReady!(model);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = ChangeNotifierProvider.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
    return child;
  }
}
