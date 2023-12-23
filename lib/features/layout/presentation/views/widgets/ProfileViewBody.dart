import 'package:ecommerce/core/Primary_Color.dart';
import 'package:ecommerce/core/network/Cache_Networ.dart';
import 'package:ecommerce/features/authantication/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileViewBody extends StatefulWidget {
  ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool? inAsyncCall;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://scontent.fcai20-4.fna.fbcdn.net/v/t39.30808-6/293947983_103737159088740_8591078618375167215_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeF_42AzjOA2wKhDW3L9XwObSJ3DuJaHQbhIncO4lodBuNPZ3k-URbJBUym2_tnddYoN8HTDWV0amlqxWbbuXWfB&_nc_ohc=gRAc8zAmXFwAX8OPWo-&_nc_ht=scontent.fcai20-4.fna&oh=00_AfDBmfMNVau9tjdtoHAEr3tAr95sqYZAxXLAiNgkl63evg&oe=658AF3D3"),
                        fit: BoxFit.fill,
                      ),
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF2F9BFF)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'osama mahmoud',
                    style: TextStyle(
                      color: primarycolor,
                      fontSize: 26,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              OptionsRow(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                  color: primarycolor,
                ),
                text: 'Your Favorite',
              ),
              const SizedBox(
                height: 18,
              ),
              OptionsRow(
                icon: Icon(
                  Icons.payment,
                  size: 30,
                  color: primarycolor,
                ),
                text: 'payment',
              ),
              const SizedBox(
                height: 18,
              ),
              OptionsRow(
                icon: Icon(
                  Icons.call,
                  size: 30,
                  color: primarycolor,
                ),
                text: 'tell your friends',
              ),
              const SizedBox(
                height: 18,
              ),
              OptionsRow(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                  color: primarycolor,
                ),
                text: 'settings',
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    CircularProgressIndicator();
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    CacheNetwork.deleteFromCache(key: "token");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginView();
                    }));
                  });
                },
                child: OptionsRow(
                  icon: Icon(
                    Icons.logout_sharp,
                    size: 30,
                    color: primarycolor,
                  ),
                  text: 'Log out',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsRow extends StatelessWidget {
  const OptionsRow({super.key, required this.icon, required this.text});
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF454545),
            fontSize: 20,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        )
      ],
    );
  }
}
