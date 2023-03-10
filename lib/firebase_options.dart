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
    apiKey: 'AIzaSyDv3HtUcqnUBSiaEE6-n8EOsTplL_WMteI',
    appId: '1:349459835004:web:a9c685b49928699d73c1f9',
    messagingSenderId: '349459835004',
    projectId: 'japal-shop',
    authDomain: 'japal-shop.firebaseapp.com',
    storageBucket: 'japal-shop.appspot.com',
    measurementId: 'G-F15109EEZR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzadRyHHThJaWEF0L-2N-Qj_yoc0ye9MI',
    appId: '1:349459835004:android:0611f49f5286555473c1f9',
    messagingSenderId: '349459835004',
    projectId: 'japal-shop',
    storageBucket: 'japal-shop.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBP7cg810ieA2BZvsr9wdF0HwikMDOeZFw',
    appId: '1:349459835004:ios:fd6eecac042cb78a73c1f9',
    messagingSenderId: '349459835004',
    projectId: 'japal-shop',
    storageBucket: 'japal-shop.appspot.com',
    iosClientId: '349459835004-49amimfqbnr2fv4rau7f6o9bqi8t42of.apps.googleusercontent.com',
    iosBundleId: 'com.ecommerce.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBP7cg810ieA2BZvsr9wdF0HwikMDOeZFw',
    appId: '1:349459835004:ios:fd6eecac042cb78a73c1f9',
    messagingSenderId: '349459835004',
    projectId: 'japal-shop',
    storageBucket: 'japal-shop.appspot.com',
    iosClientId: '349459835004-49amimfqbnr2fv4rau7f6o9bqi8t42of.apps.googleusercontent.com',
    iosBundleId: 'com.ecommerce.ecommerceApp',
  );
}
