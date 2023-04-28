part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class ToggleHiddenPassword extends SignupState{}

class ToggleLoadingState extends SignupState{}

class UpdateState extends SignupState{}

