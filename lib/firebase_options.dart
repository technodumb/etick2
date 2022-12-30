// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA2xKg1dkXYJVZ-IdS4GKZ8xPT7Ibeu8sc',
    appId: '1:25365548751:web:eac78e599ef9ca131c71ba',
    messagingSenderId: '25365548751',
    projectId: 'etick2-e7421',
    authDomain: 'etick2-e7421.firebaseapp.com',
    storageBucket: 'etick2-e7421.appspot.com',
    measurementId: 'G-L555MCQYH0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIwZyqiygU70JDvmjVPj37nw8yOpgzyVw',
    appId: '1:25365548751:android:85779c96721c855d1c71ba',
    messagingSenderId: '25365548751',
    projectId: 'etick2-e7421',
    storageBucket: 'etick2-e7421.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgMS4sChILL3n3Hyzsivqaoo5qUP0hv60',
    appId: '1:25365548751:ios:dd0fa7bc4517908a1c71ba',
    messagingSenderId: '25365548751',
    projectId: 'etick2-e7421',
    storageBucket: 'etick2-e7421.appspot.com',
    iosClientId: '25365548751-vt0k78fgb90t0a9e39imr7d5h2s7e1lj.apps.googleusercontent.com',
    iosBundleId: 'com.example.etick2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgMS4sChILL3n3Hyzsivqaoo5qUP0hv60',
    appId: '1:25365548751:ios:dd0fa7bc4517908a1c71ba',
    messagingSenderId: '25365548751',
    projectId: 'etick2-e7421',
    storageBucket: 'etick2-e7421.appspot.com',
    iosClientId: '25365548751-vt0k78fgb90t0a9e39imr7d5h2s7e1lj.apps.googleusercontent.com',
    iosBundleId: 'com.example.etick2',
  );
}
