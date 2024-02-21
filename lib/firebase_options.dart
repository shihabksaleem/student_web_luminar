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
    apiKey: 'AIzaSyC2bkZ2XuTr1sLQiCzX7_XaOwKtrEbHut4',
    appId: '1:735144361519:web:e0b24ca7d6d67a661810da',
    messagingSenderId: '735144361519',
    projectId: 'luminar-student-app',
    authDomain: 'luminar-student-app.firebaseapp.com',
    storageBucket: 'luminar-student-app.appspot.com',
    measurementId: 'G-JR79KB3W94',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxNXfv_F9TCeDIv_r2vBizNO2AbDXfBUY',
    appId: '1:735144361519:android:6cf58d564d10fe4a1810da',
    messagingSenderId: '735144361519',
    projectId: 'luminar-student-app',
    storageBucket: 'luminar-student-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9AJfo61L2d-AQLhnnhZ9GFvR8KNvH0eY',
    appId: '1:735144361519:ios:939134c762e737f81810da',
    messagingSenderId: '735144361519',
    projectId: 'luminar-student-app',
    storageBucket: 'luminar-student-app.appspot.com',
    iosBundleId: 'com.example.luminnar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9AJfo61L2d-AQLhnnhZ9GFvR8KNvH0eY',
    appId: '1:735144361519:ios:51722b29a14446401810da',
    messagingSenderId: '735144361519',
    projectId: 'luminar-student-app',
    storageBucket: 'luminar-student-app.appspot.com',
    iosBundleId: 'com.example.luminnar.RunnerTests',
  );
}
