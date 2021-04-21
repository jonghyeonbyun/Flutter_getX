import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_demo/controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            _controller.onboardingPages[index].imageAsset),
                        SizedBox(height: 32),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: _controller.selectedPageIndex == index
                              ? Colors.blue
                              : Colors.grey,
                          shape: BoxShape.circle),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    _controller.forwardAction();
                  },
                  elevation: 0,
                  child: Obx(() {
                    return Text(_controller.isLastPage ? 'Start' : 'Next');
                  }),
                ))
          ],
        ),
      ),
    );
  }
}