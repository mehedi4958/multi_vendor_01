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
    apiKey: 'AIzaSyDAstaBFv_UOhi8pW74FdSKxWCqPYkh554',
    appId: '1:834673575543:web:59b60a090bb68e4b03a872',
    messagingSenderId: '834673575543',
    projectId: 'multi-vendor-01',
    authDomain: 'multi-vendor-01.firebaseapp.com',
    databaseURL: 'https://multi-vendor-01-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'multi-vendor-01.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzfU7RqEtaBLUAp2l9RBQXTjrP8rZ3Nr8',
    appId: '1:834673575543:android:19cfc3b0949b3bc503a872',
    messagingSenderId: '834673575543',
    projectId: 'multi-vendor-01',
    databaseURL: 'https://multi-vendor-01-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'multi-vendor-01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHViy1HHHIqv78ORcKc3s3SQg9XEwsKaQ',
    appId: '1:834673575543:ios:bb3e0c611546b84e03a872',
    messagingSenderId: '834673575543',
    projectId: 'multi-vendor-01',
    databaseURL: 'https://multi-vendor-01-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'multi-vendor-01.appspot.com',
    iosClientId: '834673575543-tjkr3am98ga0e6cqlc0i7ta6lmira5km.apps.googleusercontent.com',
    iosBundleId: 'com.example.multiVendor01',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHViy1HHHIqv78ORcKc3s3SQg9XEwsKaQ',
    appId: '1:834673575543:ios:bb3e0c611546b84e03a872',
    messagingSenderId: '834673575543',
    projectId: 'multi-vendor-01',
    databaseURL: 'https://multi-vendor-01-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'multi-vendor-01.appspot.com',
    iosClientId: '834673575543-tjkr3am98ga0e6cqlc0i7ta6lmira5km.apps.googleusercontent.com',
    iosBundleId: 'com.example.multiVendor01',
  );
}
