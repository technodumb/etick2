import 'dart:async';

import 'package:etick2/provider/provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<FirebaseProvider>(context);
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/login');
    });

    return Consumer(
        builder: (context, FirebaseProvider firebaseProvider, child) =>
            Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ));
  }
}
