import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBll34JfidGu5lfNswJ2qaWvLQ3uU5tDts",
    authDomain: "fir-extra-first.firebaseapp.com",
    projectId: "fir-extra-first",
    storageBucket: "fir-extra-first.appspot.com",
    messagingSenderId: "579784740674",
    appId: "1:579784740674:web:1bae29bc11ae9fb92002db",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBll34JfidGu5lfNswJ2qaWvLQ3uU5tDts",
    authDomain: "fir-extra-first.firebaseapp.com",
    projectId: "fir-extra-first",
    storageBucket: "fir-extra-first.appspot.com",
    messagingSenderId: "579784740674",
    appId: "1:579784740674:web:1bae29bc11ae9fb92002db",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyBll34JfidGu5lfNswJ2qaWvLQ3uU5tDts",
    authDomain: "fir-extra-first.firebaseapp.com",
    projectId: "fir-extra-first",
    storageBucket: "fir-extra-first.appspot.com",
    messagingSenderId: "579784740674",
    appId: "1:579784740674:web:1bae29bc11ae9fb92002db",
  );

}