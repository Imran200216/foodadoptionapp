import 'package:flutter/material.dart';

class GetStartedProvider extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);

  // Method to manually navigate to the next page
  void nextPage() {
    if (pageController.hasClients) {
      int nextPage = (pageController.page?.toInt() ?? 0) + 1;
      if (nextPage >= 3) {
        nextPage = 0; // Reset to the first page after the last one
      }
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
      notifyListeners();
    }
  }

  // Method to manually navigate to the previous page
  void previousPage() {
    if (pageController.hasClients) {
      int prevPage = (pageController.page?.toInt() ?? 0) - 1;
      if (prevPage < 0) {
        prevPage =
            2; // Set to the last page if user goes back from the first page
      }
      pageController.animateToPage(
        prevPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
      notifyListeners();
    }
  }
}
