import 'package:ecommerce/core/network/Cache_Networ.dart';
import 'package:ecommerce/features/Splash/Presentation/Views/splash_View.dart';
import 'package:ecommerce/features/layout/presentation/views/home_View.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.sharedPreferencesIntilization();
  token = CacheNetwork.getFromCache(key: 'token');
  print("The Token is $token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token!.isEmpty ? const SplashView() : const HomeView(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xffEEF5FF),
        ));
  }
}
