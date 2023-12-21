part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String errorMassage;

  RegisterFailure({required this.errorMassage});
}

final class RegisterLouding extends RegisterState {}
