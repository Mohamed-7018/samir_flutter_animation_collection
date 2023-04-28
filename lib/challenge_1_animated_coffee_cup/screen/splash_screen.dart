import 'dart:async';

import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_1_animated_coffee_cup/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_1_animated_coffee_cup/widgets/drink_clipper.dart';
import 'package:samir_flutter_ui_challenge/challenge_1_animated_coffee_cup/widgets/dunkin_painter.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? cupController;
  AnimationController? coverController;
  AnimationController? coverTopController;
  AnimationController? strawController;
  AnimationController? shadowController;
  AnimationController? fadeController;
  AnimationController? filledController;
  AnimationController? topController;

  Animation<double>? cupAnimation;
  Animation<double>? coverAnimation;
  Animation<double>? coverTopAnimation;
  Animation<double>? strawAnimation;
  Animation<double>? shadowAnimation;
  Animation<double>? fadeAnimation;
  Animation<double>? filledAnimation;
  Animation<double>? topAnimation;

  Timer? timer;
  @override
  void initState() {
    super.initState();
    shadowController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: ChallengeOneAppSizes.size_500.toInt()),
    );
    cupController = AnimationController(
        vsync: this,
        duration: Duration(seconds: ChallengeOneAppSizes.size_2.toInt()));
    coverController = AnimationController(
        vsync: this,
        duration: Duration(seconds: ChallengeOneAppSizes.size_2.toInt()));
    coverTopController = AnimationController(
        vsync: this,
        duration: Duration(seconds: ChallengeOneAppSizes.size_2.toInt()));
    strawController = AnimationController(
        vsync: this,
        duration: Duration(seconds: ChallengeOneAppSizes.size_1.toInt()));
    fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: ChallengeOneAppSizes.size_500.toInt()),
    );
    filledController = AnimationController(
        vsync: this,
        duration: Duration(seconds: ChallengeOneAppSizes.size_2.toInt()));
    topController = AnimationController(
        vsync: this,
        duration: Duration(seconds: ChallengeOneAppSizes.size_2.toInt()));
    cupAnimation = Tween<double>(
            begin: ChallengeOneAppSizes.size_0,
            end: ChallengeOneAppSizes.size_1)
        .animate(cupController!);
    shadowAnimation = Tween<double>(
            begin: ChallengeOneAppSizes.size_0,
            end: ChallengeOneAppSizes.size_1)
        .animate(shadowController!);
    Timer(Duration(seconds: ChallengeOneAppSizes.size_2.toInt()), () {
      cupController!.forward();
      shadowController!.forward();
    });
    cupController!.addListener(() {
      if (cupAnimation!.value == ChallengeOneAppSizes.size_1) {
        coverController!.forward();
        coverAnimation = Tween<double>(
                begin: ChallengeOneAppSizes.size_0,
                end: ChallengeOneAppSizes.size_1)
            .animate(coverController!);
      }
      setState(() {});
    });
    coverController!.addListener(() {
      if (coverAnimation!.value == ChallengeOneAppSizes.size_1) {
        coverTopController!.forward();
        coverTopAnimation = Tween<double>(
                begin: ChallengeOneAppSizes.size_0,
                end: ChallengeOneAppSizes.size_1)
            .animate(coverTopController!);
      }
      setState(() {});
    });

    coverTopController!.addListener(() {
      if (coverTopAnimation!.value == ChallengeOneAppSizes.size_1) {
        strawController!.forward();
        strawAnimation = Tween<double>(
                begin: ChallengeOneAppSizes.size_0,
                end: ChallengeOneAppSizes.size_1)
            .animate(strawController!);
      }
      setState(() {});
    });

    strawController!.addListener(() {
      if (strawAnimation!.value == ChallengeOneAppSizes.size_1) {
        fadeController!.forward();
        fadeAnimation = Tween<double>(
                begin: ChallengeOneAppSizes.size_0,
                end: ChallengeOneAppSizes.size_1)
            .animate(fadeController!);
      }
      setState(() {});
    });
    shadowController!.addListener(() {
      setState(() {});
    });
    fadeController!.addListener(() {
      if (fadeAnimation!.value > ChallengeOneAppSizes.size_05) {
        topController!.forward();
        filledController!.forward();
        filledAnimation = Tween<double>(
                begin: ChallengeOneAppSizes.size_0,
                end: ChallengeOneAppSizes.size_1000)
            .animate(filledController!);
        topController!.forward();
        topAnimation =
            Tween<double>(begin: 0.0, end: ChallengeOneAppSizes.size_1000)
                .animate(topController!);
      }
      setState(() {});
    });

    filledController!.addListener(() {
      setState(() {});
    });
    topController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ChallengeOneAppImages.splashBackground),
              fit: BoxFit.cover,
              opacity: ChallengeOneAppSizes.size_05),
        ),
        child: Stack(
          children: [
            CustomPaint(
              painter: DunKinPainter(
                cupProgress: cupAnimation!.value,
                coverProgress:
                    coverAnimation?.value ?? ChallengeOneAppSizes.size_0,
                coverTopProgress:
                    coverTopAnimation?.value ?? ChallengeOneAppSizes.size_0,
                strawProgress:
                    strawAnimation?.value ?? ChallengeOneAppSizes.size_0,
                shadowProgress:
                    shadowAnimation?.value ?? ChallengeOneAppSizes.size_0,
                topProgress: topAnimation?.value ?? ChallengeOneAppSizes.size_0,
              ),
              child: Container(),
            ),
            ClipPath(
              clipper: DrinkClipper(),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: DrinkClipper(),
                      child: Container(
                        color: ChallengeOneAppColors.splashColor,
                        height: filledAnimation?.value ??
                            ChallengeOneAppSizes.size_0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: HeaderClipper(),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipPath(
                      clipper: HeaderClipper(),
                      child: Container(
                        color: ChallengeOneAppColors.splashColor,
                        height:
                            topAnimation?.value ?? ChallengeOneAppSizes.size_0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: fadeAnimation?.value ?? ChallengeOneAppSizes.size_0,
              duration: Duration(seconds: ChallengeOneAppSizes.size_1.toInt()),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: ChallengeOneAppSizes.size_20,
                      top: ChallengeOneAppSizes.size_50,
                      left: ChallengeOneAppSizes.size_7),
                  child: Image.asset(
                    ChallengeOneAppImages.logo,
                    height: ChallengeOneAppSizes.size_200,
                    width: ChallengeOneAppSizes.size_200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
