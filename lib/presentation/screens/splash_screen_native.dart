import 'package:cat_breeds_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreenNative extends StatefulWidget {
  static const String name = 'splash_screen_native';

  const SplashScreenNative({super.key});

  @override
  State<SplashScreenNative> createState() => _SplashState();
}

class _SplashState extends State<SplashScreenNative> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash_logo/splash_logo.png',
              height: 200,
            ),
            Text('CatBreeds', style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
