import 'package:flutter/cupertino.dart';
import 'package:onboarding_demo/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:onboarding_demo/views/home.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //go to home page
      Get.offAll(Home());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/Travelers.png', 'Title_Area',
        'here is description Area. you can describe about this page.'),
    OnboardingInfo('assets/Logic.png', 'Title_Area',
        'here is description Area. you can describe about this page.'),
    OnboardingInfo('assets/Wall_post.png', 'Title_Area',
        'here is description Area. you can describe about this page.')
  ];
}
