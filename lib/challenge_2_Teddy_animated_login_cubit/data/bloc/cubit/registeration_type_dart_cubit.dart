import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/models/registeration_type.dart';

part 'registeration_type_dart_state.dart';

class RegisterationTypeDartCubit extends Cubit<RegisterationTypeDartState> {
  static RegisterationTypeDartCubit get(BuildContext context) =>
      BlocProvider.of(context);

  RegisterationTypeDartCubit() : super(RegisterationTypeDartInitial());

  RegistrationType _type = RegistrationType.login;
  final GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  RegistrationType get type => _type;
  GlobalKey<FlipCardState> get cardKey => _cardKey;

  void toggleRegisterationType() {
    _cardKey.currentState!.toggleCard();
    if (_type == RegistrationType.login) {
      _type = RegistrationType.signup;
    } else {
      _type = RegistrationType.login;
    }
    emit(ChangeRegisterationType());
  }
}
