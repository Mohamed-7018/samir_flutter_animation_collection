part of 'login_cubit_cubit.dart';

@immutable
abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}

class ToggleHiddenPassword extends LoginCubitState{}

class UpdateState extends LoginCubitState{}

class ToggleLoadingState extends LoginCubitState{}
