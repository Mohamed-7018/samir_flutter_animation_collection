import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/models/dices_data.dart';

part 'dices_state.dart';

class DicesCubit extends Cubit<DicesState> {
  static DicesCubit get(BuildContext context) => BlocProvider.of(context);
  DicesCubit() : super(DicesInitial()) {
    makeDiscs();
  }

  void changeDices() {
    makeDiscs();
    emit(ChangeDices());
  }
}
