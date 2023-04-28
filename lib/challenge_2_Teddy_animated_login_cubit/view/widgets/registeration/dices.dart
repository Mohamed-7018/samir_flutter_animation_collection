import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/dices_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/models/dices_data.dart';

class VariousDiscs extends StatelessWidget {
  const VariousDiscs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DicesCubit, DicesState>(
      buildWhen: (previous, current) {
        if (current is ChangeDices) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            DicesCubit.get(context).changeDices();
          },
          child: Stack(
            children: [
              for (final disc in discs)
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.2,
                    child: AnimatedAlign(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOutCubic,
                      alignment: disc.alignment,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        decoration: BoxDecoration(
                          color: disc.color,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: disc.size,
                        width: disc.size,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
