import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseStorageProvider = Provider(
  (ref) => FirebaseStorage.instance,
);

final firebaseAuthProvider = Provider(
  (ref) => FirebaseAuth.instance,
);

final facebookAuthProvider = Provider(
  (ref) => FacebookAuth.instance,
);
