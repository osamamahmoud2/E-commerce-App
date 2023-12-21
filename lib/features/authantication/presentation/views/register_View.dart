import 'package:ecommerce/features/authantication/presentation/cotroller/Register_Cubit/register_cubit.dart';
import 'package:ecommerce/features/authantication/presentation/views/widgets/Register_View_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: Scaffold(
          body: RegisterViewBody(),
        ));
  }
}
