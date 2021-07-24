import 'package:flutter/cupertino.dart';

class StateManager extends ChangeNotifier {
  void setState() {
    notifyListeners();
  }
}
