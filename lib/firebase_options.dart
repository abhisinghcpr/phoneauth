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
    apiKey: 'AIzaSyDPbeEWuFfQcCm-ay-vEWZ-Ny4bNOnoL5M',
    appId: '1:586311412298:web:025a0d593ef68b4d2c14b3',
    messagingSenderId: '586311412298',
    projectId: 'flutter-practise-f6756',
    authDomain: 'flutter-practise-f6756.firebaseapp.com',
    storageBucket: 'flutter-practise-f6756.appspot.com',
    measurementId: 'G-1TRYNVRVJ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrlD8rX63YqNczGD-NplvAHCJ7zJt6ME0',
    appId: '1:586311412298:android:633dbf214ce66bd32c14b3',
    messagingSenderId: '586311412298',
    projectId: 'flutter-practise-f6756',
    storageBucket: 'flutter-practise-f6756.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDZV0sMYNIjDIyEJithG9YN4CQp5eP3bE',
    appId: '1:586311412298:ios:883d17e820ae10aa2c14b3',
    messagingSenderId: '586311412298',
    projectId: 'flutter-practise-f6756',
    storageBucket: 'flutter-practise-f6756.appspot.com',
    iosBundleId: 'com.example.practise',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDZV0sMYNIjDIyEJithG9YN4CQp5eP3bE',
    appId: '1:586311412298:ios:792bc0f90084a9482c14b3',
    messagingSenderId: '586311412298',
    projectId: 'flutter-practise-f6756',
    storageBucket: 'flutter-practise-f6756.appspot.com',
    iosBundleId: 'com.example.practise.RunnerTests',
  );
}
