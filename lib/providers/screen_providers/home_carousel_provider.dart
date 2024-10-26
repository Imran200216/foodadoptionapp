import 'package:flutter/material.dart';

class HomeCarouselProvider with ChangeNotifier {
  int _activeIndex = 0;
  final PageController _controller = PageController();

  int get activeIndex => _activeIndex;

  PageController get controller => _controller;

  void setActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  void animateToPage(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
