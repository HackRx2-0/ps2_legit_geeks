import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/navigation_service.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;
  void setState({ViewState viewState}) {
    _state = viewState;
    notifyListeners();
  }
}
