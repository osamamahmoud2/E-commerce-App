part of 'login_cubit_cubit.dart';

sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitSucess extends LoginCubitState {}

final class LoginCubitFailur extends LoginCubitState {
  final String errorMass;

  LoginCubitFailur({required this.errorMass});
}

final class LoginCubitLoding extends LoginCubitState {}
