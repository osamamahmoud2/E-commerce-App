import 'package:ecommerce/core/Primary_Color.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/ProfileViewBody.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        foregroundColor: primarycolor,
        backgroundColor: Colors.white,
      ),
      body: ProfileViewBody(),
    );
  }
}
