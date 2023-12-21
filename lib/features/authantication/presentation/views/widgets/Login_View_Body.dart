import 'package:ecommerce/core/Primary_Color.dart';
import 'package:ecommerce/features/layout/presentation/views/home_View.dart';
import 'package:ecommerce/features/authantication/presentation/cotroller/login_Cubit/login_cubit_cubit.dart';
import 'package:ecommerce/features/authantication/presentation/views/register_View.dart';
import 'package:ecommerce/features/authantication/presentation/views/widgets/Custom_Text_Fiald.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitState>(builder: (context, state) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formkey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const Text(
                  'Sign In To Your Account',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Let’s Sign In!!!',
                  style: TextStyle(color: Color(0xff757575), fontSize: 17),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/person6 1.png',
                    height: 120,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  'Username',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Image.asset(
                        'assets/images/Profile.png',
                        width: 20,
                      ),
                    ),
                    Expanded(
                        child: CustomTextFiled(
                      fieldname: 'Username',
                      controller: usernamecontroller,
                      obscureText: false,
                      hintText: 'Enter YourUsername',
                    ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Image.asset(
                        'assets/images/Unlock.png',
                        width: 20,
                      ),
                    ),
                    Expanded(
                        child: CustomTextFiled(
                      fieldname: 'Password',
                      controller: passwordcontroller,
                      obscureText: true,
                      hintText: 'Enter Your Password',
                    ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xff3681F0), fontSize: 15),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).loginn(
                          email: usernamecontroller.text,
                          password: passwordcontroller.text);
                    }
                    usernamecontroller.clear();
                    passwordcontroller.clear();
                  },
                  child: state is LoginCubitLoding
                      ? CircularProgressIndicator(color: primarycolor)
                      : Container(
                          decoration: BoxDecoration(
                              color: primarycolor,
                              borderRadius: BorderRadius.circular(10)),
                          height: 60,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/Login.png',
                            width: double.infinity,
                          ),
                        ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Row(children: [
                  Expanded(
                      child: Divider(
                    thickness: 2.5,
                    endIndent: 15,
                  )),
                  Text("OR"),
                  Expanded(
                      child: Divider(
                    thickness: 2.5,
                    indent: 15,
                  )),
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset(
                    'assets/images/GoogleAuth.png',
                    width: 90,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Row(children: [
                  const Text(
                    'Are you haven’t account?',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const RegisterView())));
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Color(0xff3681F0), fontSize: 17),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is LoginCubitSucess) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeView()));
      } else if (state is LoginCubitFailur) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  backgroundColor: Colors.red,
                  content: Text(state.errorMass),
                ));
      }
    });
  }
}
