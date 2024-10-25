import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavProvider extends ChangeNotifier {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  void changeTabIndex(int index) {
    controller.index = index;
    notifyListeners();
  }
}
