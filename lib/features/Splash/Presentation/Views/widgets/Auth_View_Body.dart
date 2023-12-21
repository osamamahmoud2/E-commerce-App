import 'package:ecommerce/features/authantication/presentation/views/login_view.dart';
import 'package:ecommerce/features/authantication/presentation/views/register_View.dart';
import 'package:flutter/material.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Image.asset(
            'assets/images/Group 1.png',
            height: 125,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/Kur E-Shop.png',
              height: 90,
            ),
          ),
          Image.asset(
            'assets/images/3516854 1.png',
            height: 326,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ));
            },
            child: Image.asset(
              'assets/images/Login.png',
              height: MediaQuery.of(context).size.height * 0.09,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterView(),
                  ));
            },
            child: Image.asset('assets/images/Frame 145.png'),
          )
        ],
      ),
    );
  }
}
