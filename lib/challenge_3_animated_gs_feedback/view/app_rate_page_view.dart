import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_3_animated_gs_feedback/view/rate_the_app_page.dart';

import 'feedbacks_page.dart';


class AppRatePageView extends StatefulWidget {
  static String routeName = "/rateApp";

  const AppRatePageView({super.key});

  @override
  _AppRatePageViewState createState() => _AppRatePageViewState();
}

class _AppRatePageViewState extends State<AppRatePageView> {

  PageController controller = PageController(initialPage: 0);
  late List boxes;

  @override
  void initState() {
    super.initState();
    boxes = [
      RateTheAppPage(controller: controller),
      FeedbackScreen(controller: controller)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, index) => boxes[index],
      ),
    );
  }
}