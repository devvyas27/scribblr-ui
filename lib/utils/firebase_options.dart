import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDnzPnA2miSk_kKXLRjYjC-vGW_rJiS5lc',
    appId: '1:390414775798:web:6810689181c30e01aa03d7',
    messagingSenderId: '390414775798',
    projectId: 'prokit-flutter',
    authDomain: 'prokit-flutter.firebaseapp.com',
    databaseURL: 'https://prokit-flutter.firebaseio.com',
    storageBucket: 'prokit-flutter.appspot.com',
    measurementId: 'G-98QQYB8513',
  );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyAcGIOKeHzr8hn8B8FG3meb5bm043ABxEA",
      authDomain: "scribblr-ui.firebaseapp.com",
      projectId: "scribblr-ui",
      storageBucket: "scribblr-ui.firebasestorage.app",
      messagingSenderId: "537418024601",
      appId: "1:537418024601:web:f63aab34b47e2513a89a08",
      measurementId: "G-16702KEHWQ"
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    databaseURL: '',
    storageBucket: '',
    androidClientId: '',
    iosClientId: '',
    iosBundleId: '',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    databaseURL: '',
    storageBucket: '',
    androidClientId: '',
    iosClientId: '',
    iosBundleId: '',
  );
}
