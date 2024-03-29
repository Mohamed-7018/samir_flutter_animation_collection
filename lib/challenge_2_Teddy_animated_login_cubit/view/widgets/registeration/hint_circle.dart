import 'dart:async';

import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/dices_cubit.dart';

class HintCircle extends StatefulWidget {
  const HintCircle({super.key});

  @override
  HintCircleState createState() => HintCircleState();
}

class HintCircleState extends State<HintCircle>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation, animation2;
  late AnimationController animationController;
  late double animatedContainerWidth;
  late bool isClicked;
  late Timer time;

  @override
  void dispose() {
    animationController.dispose();
    time.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animatedContainerWidth = GlobalAppSizes.s_50;
    isClicked = false;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    time = Timer.periodic(
      Duration(seconds: GlobalAppSizes.s_1.toInt()),
      (timer) {
        if (timer.tick <= GlobalAppSizes.s_5) {
          if (timer.tick == GlobalAppSizes.s_1) {
            setState(() {
              animatedContainerWidth = MediaQuery.of(context).size.width * 0.55;
              isClicked = true;
              animationController.forward();
            });
          } else if (timer.tick == GlobalAppSizes.s_5) {
            setState(() {
              animatedContainerWidth = GlobalAppSizes.s_50;
              isClicked = false;
              animationController.reverse();
            });
          }
        } else {
          timer.cancel();
        }
      },
    );

    animation = Tween(begin: GlobalAppSizes.s_0, end: GlobalAppSizes.s_1)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutBack));
    animation2 = Tween(begin: GlobalAppSizes.s_1, end: GlobalAppSizes.s_0)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + GlobalAppSizes.s_20,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          AnimatedContainer(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: GlobalAppSizes.s_15),
            width: animatedContainerWidth,
            height: GlobalAppSizes.s_40,
            duration: Duration(milliseconds: GlobalAppSizes.s_700.toInt()),
            curve: Curves.easeInOutBack,
            decoration: BoxDecoration(
              color: GlobalAppColors.appPink.withOpacity(0.4),
              borderRadius: BorderRadius.circular(GlobalAppSizes.s_50),
            ),
            child: ScaleTransition(
              scale: animation,
              child: AnimatedOpacity(
                opacity: animation2.value,
                duration: const Duration(milliseconds: 300),
                child: Text(
                  GlobalAppStrings.appHintCircleText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: GlobalAppColors.kScaffoldLight),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              DicesCubit.get(context).changeDices();

              if (!isClicked) {
                setState(() {
                  animatedContainerWidth =
                      MediaQuery.of(context).size.width * 0.55;
                  isClicked = true;
                  animationController.forward();
                });
              } else {
                setState(() {
                  animatedContainerWidth = GlobalAppSizes.s_50;
                  isClicked = false;
                  animationController.reverse();
                });
              }
            },
            child: RotationTransition(
              turns: animation,
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                width: GlobalAppSizes.s_60,
                height: GlobalAppSizes.s_60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: GlobalAppColors.appBlue,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(GlobalAppImages.logo),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
