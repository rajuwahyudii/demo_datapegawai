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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDatikmdEre-C0UjubtklFQZQIoxHRoAmw',
    appId: '1:606999277715:android:70b87d11d80bac07439d66',
    messagingSenderId: '606999277715',
    projectId: 'lapakchina-id',
    storageBucket: 'lapakchina-id.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2FwXJsx4hRfCqFjH1DA-paoflikz_c9o',
    appId: '1:606999277715:ios:3b4d00468e7533b8439d66',
    messagingSenderId: '606999277715',
    projectId: 'lapakchina-id',
    storageBucket: 'lapakchina-id.appspot.com',
    androidClientId:
        '606999277715-h4g57onpfanlkks6rlgdqma9t5sev8t2.apps.googleusercontent.com',
    iosClientId:
        '606999277715-hhucfbruc8pi99ilf9gujbups58imh9p.apps.googleusercontent.com',
    iosBundleId: 'com.lapak.china',
  );
}
