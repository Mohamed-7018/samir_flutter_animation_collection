import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_3_animated_gs_feedback/view/app_rate_page_view.dart';


class AnimatedGoogleSheetFeedback extends StatelessWidget {
  const AnimatedGoogleSheetFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
         
          home: AppRatePageView(),
        );
    
  }
}
