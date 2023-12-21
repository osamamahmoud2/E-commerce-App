import 'package:ecommerce/core/Primary_Color.dart';
import 'package:ecommerce/features/layout/presentation/views/home_View.dart';
import 'package:ecommerce/features/authantication/presentation/cotroller/Register_Cubit/register_cubit.dart';
import 'package:ecommerce/features/authantication/presentation/views/login_view.dart';
import 'package:ecommerce/features/authantication/presentation/views/widgets/Custom_Text_Fiald.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final emailamecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        builder: (context, state) {
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
                  'Sign Up Here',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Let’s Create Your Account!!!',
                  style: TextStyle(color: Color(0xff757575), fontSize: 17),
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
                  'Email  ',
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
                        'assets/images/Vector (2).png',
                        width: 20,
                      ),
                    ),
                    Expanded(
                        child: CustomTextFiled(
                      fieldname: ' E-mail',
                      controller: emailamecontroller,
                      obscureText: false,
                      hintText: 'Enter Your E-mail',
                    ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text(
                  'Phone  ',
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
                        'assets/images/Vector (2).png',
                        width: 20,
                      ),
                    ),
                    Expanded(
                        child: CustomTextFiled(
                      fieldname: "Phone",
                      controller: phonecontroller,
                      obscureText: false,
                      hintText: 'Enter Your Phone',
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
                  height: MediaQuery.of(context).size.height * 0.03,
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
                      BlocProvider.of<RegisterCubit>(context).register(
                          username: usernamecontroller.text,
                          email: emailamecontroller.text,
                          phone: phonecontroller.text,
                          password: passwordcontroller.text);
                    }
                  },
                  child: state is RegisterLouding
                      ? const CircularProgressIndicator(
                          color: Color(0xff89E581),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: primarycolor,
                              borderRadius: BorderRadius.circular(10)),
                          height: 60,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/Register.png',
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
                  height: MediaQuery.of(context).size.height * 0.003,
                ),
                Row(children: [
                  const Text(
                    'Are you have account?',
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
                              builder: ((context) => const LoginView())));
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: primarycolor, fontSize: 17),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is RegisterFailure) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  backgroundColor: Colors.red,
                  content: Text(state.errorMassage),
                ));
      } else if (state is RegisterSuccess) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeView()));
      }
    });
  }
}
