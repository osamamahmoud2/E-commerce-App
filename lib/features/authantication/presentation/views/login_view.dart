import 'package:ecommerce/features/authantication/presentation/cotroller/login_Cubit/login_cubit_cubit.dart';
import 'package:ecommerce/features/authantication/presentation/views/widgets/Login_View_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginViewBody(),
      ),
    );
  }
}
