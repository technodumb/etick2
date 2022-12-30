import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'provider/provider.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => MovieSelectProvider()),
        ChangeNotifierProvider(create: (_) => SeatSelectProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/splash',
        routes: routes,
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
      ),
    ),
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
