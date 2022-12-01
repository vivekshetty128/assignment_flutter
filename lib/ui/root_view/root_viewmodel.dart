import 'package:flutter/material.dart';

class RootViewModel extends ChangeNotifier {
  int _currentIndex = 0; // drawer initialize with 0 index
  int get currentIndex => _currentIndex;

  int _bottomBarCurrentIndex = 0; //bottom-bar initialize with 0 index
  int get bottomBarCurrentIndex => _bottomBarCurrentIndex;
  List<int> routeIndexStack = [0];

  void setBottombarIndex(int index) {
    routeIndexStack.clear();
    _currentIndex = 0;
    routeIndexStack.add(_currentIndex);
    _bottomBarCurrentIndex = index;
    notifyListeners();
  }

  void onTap(int index) {
    if (currentIndex != index) {
      _currentIndex = index;
      routeIndexStack.add(_currentIndex);
      notifyListeners();
    }
  }

  bool canExitApp() {
    if (routeIndexStack.isEmpty || routeIndexStack.length == 1) return true;
    routeIndexStack.removeLast();
    if (routeIndexStack.isNotEmpty) {
      int _previousIndex = routeIndexStack.last;
      _currentIndex = _previousIndex;
      notifyListeners();
      return false;
    }
    return true;
  }
}
