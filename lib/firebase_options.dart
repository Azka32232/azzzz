// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCvGkH1xBveG5sdqNWc2HPlAXqJ9BOZXD4',
    appId: '1:767198093072:web:7286f7eba3be827dc94f95',
    messagingSenderId: '767198093072',
    projectId: 'aplikasi-berita-9ce6e',
    authDomain: 'aplikasi-berita-9ce6e.firebaseapp.com',
    storageBucket: 'aplikasi-berita-9ce6e.appspot.com',
    measurementId: 'G-BFW08Y0BPE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2_RtX9qQ9AKU9GaTEV_P80Rr3c1_Y4Yk',
    appId: '1:767198093072:android:f1213cbb2ea0847fc94f95',
    messagingSenderId: '767198093072',
    projectId: 'aplikasi-berita-9ce6e',
    storageBucket: 'aplikasi-berita-9ce6e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-jXhPeTeii1fztPNo-8V2HFqn9x8JLlI',
    appId: '1:767198093072:ios:435a0f28b34c2b73c94f95',
    messagingSenderId: '767198093072',
    projectId: 'aplikasi-berita-9ce6e',
    storageBucket: 'aplikasi-berita-9ce6e.appspot.com',
    iosBundleId: 'com.portal.berita',
  );
}