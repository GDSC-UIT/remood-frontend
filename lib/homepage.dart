import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/modules/onboarding/screens/onboarding_screen.dart';
import 'package:remood/app/modules/splash/screens/splash_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future _boxLoadFuture;

  @override
  void initState() {
    super.initState();
    _boxLoadFuture = Future.wait([Hive.openBox('mybox')]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _boxLoadFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // while waiting for `Hive.openBox()` to finish
            return const SplashScreen();
          } else {
            if (snapshot.hasError) {
              // if `Hive.openBox()` threw an error
              return Center(child: Text('Error:\n\n ${snapshot.error}'));
            } else {
              // success, continue with app
              return const OnboardingScreen();
            }
          }
        },
      ),
    );
  }
}
