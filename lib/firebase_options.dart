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
    apiKey: 'AIzaSyBWtJ-FEY_w6Uw5IonqUHjdWUPxeIQ8IL4',
    appId: '1:544088241458:web:4f4ead58a3cf36a3d7132b',
    messagingSenderId: '544088241458',
    projectId: 'chat-app-459d3',
    authDomain: 'chat-app-459d3.firebaseapp.com',
    storageBucket: 'chat-app-459d3.appspot.com',
    measurementId: 'G-TK8LRQMK4E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEfnSfPy44-jANiNJW6_gP9mlbUfpG4a0',
    appId: '1:544088241458:android:152bca103784c13bd7132b',
    messagingSenderId: '544088241458',
    projectId: 'chat-app-459d3',
    storageBucket: 'chat-app-459d3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3cXeQ-MB4Smlyv1MrWur8enGHD6pC_NE',
    appId: '1:544088241458:ios:3469e2e24f4341aed7132b',
    messagingSenderId: '544088241458',
    projectId: 'chat-app-459d3',
    storageBucket: 'chat-app-459d3.appspot.com',
    iosClientId: '544088241458-uslka1a7418ngd3iki298jhot1r7ell2.apps.googleusercontent.com',
    iosBundleId: 'com.example.chattApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3cXeQ-MB4Smlyv1MrWur8enGHD6pC_NE',
    appId: '1:544088241458:ios:9dece9a3c6cc8c95d7132b',
    messagingSenderId: '544088241458',
    projectId: 'chat-app-459d3',
    storageBucket: 'chat-app-459d3.appspot.com',
    iosClientId: '544088241458-607ken89lrlhoolmi9ainih622d03qkg.apps.googleusercontent.com',
    iosBundleId: 'com.example.chattApp.RunnerTests',
  );
}
