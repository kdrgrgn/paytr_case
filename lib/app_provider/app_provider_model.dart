
import 'package:flutter/widgets.dart';
import 'package:paytr_case/enums.dart';

class BaseModel extends ChangeNotifier {


  ViewState _viewState = ViewState.Idle;
  ViewState _viewState2 = ViewState.Idle;
  ViewState _viewState3 = ViewState.Idle;


  ViewState get viewState => _viewState;
  bool get isIdle => _viewState == ViewState.Idle;
  bool get isBusy => _viewState == ViewState.Busy;
  bool get isError => _viewState3 == ViewState.Error;

  ViewState get viewState2 => _viewState2;
  bool get isIdle2 => _viewState2 == ViewState.Idle;
  bool get isBusy2 => _viewState2 == ViewState.Busy;
  bool get isError2 => _viewState3 == ViewState.Error;

  ViewState get viewState3 => _viewState3;
  bool get isIdle3 => _viewState3 == ViewState.Idle;
  bool get isBusy3 => _viewState3 == ViewState.Busy;
  bool get isError3 => _viewState3 == ViewState.Error;


  void setViewState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }

  void setViewState2(ViewState state) {
    _viewState2 = state;
    notifyListeners();
  }

  void setViewState3(ViewState state) {
    _viewState3 = state;
    notifyListeners();
  }



}
