import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zomato_clone/common/firebaseprovider/firebase_instance_provider.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/models/user.dart';

final loginSignUpRepositoryProvider = Provider(
    (ref) => LoginSignUpRepository(ref.watch(firebaseAuthProvider), ref.watch(facebookAuthProvider)));

class LoginSignUpRepository {
  final FirebaseAuth _firebaseAuth;
  final FacebookAuth _facebookAuth;
  LoginSignUpRepository(this._firebaseAuth, this._facebookAuth);

  Future<Pair<Pair<UserData, bool>?, String?>> signInOrSignUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;
      final userData = UserData(
          name: user?.displayName ?? "",
          email: user?.email ?? "",
          address: "",
          uid: user?.uid ?? "",
          phone: user?.phoneNumber ?? "",
          profileImage: user?.photoURL ?? "");
      var isNewUser= true;
      if(userCredential.additionalUserInfo?.isNewUser != true){
        isNewUser= false;
      }
      return Pair(Pair(userData, isNewUser), null);
    } on FirebaseAuthException catch (e) {
      return Pair(null, e.toString());
    } catch (e) {
      return Pair(null, e.toString());
    }
  }

  void signInWithPhone(String phoneNumber, Function(String, int?) verification) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          verification(verificationId, resendToken);
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> verifyOTP({
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<Pair<Pair<UserData, bool>?, String?>> signInOrSignUpWithFacebook() async {
    try {
      final LoginResult loginResult = await _facebookAuth.login(permissions: ["email"]);
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final userCredential= await _firebaseAuth.signInWithCredential(facebookAuthCredential);
      final user = userCredential.user;
      final userData = UserData(
          name: user?.displayName ?? "",
          email: user?.email ?? "",
          address: "",
          uid: user?.uid ?? "",
          phone: user?.phoneNumber ?? "",
          profileImage: user?.photoURL ?? "");
      var isNewUser= true;
      if(userCredential.additionalUserInfo?.isNewUser != true){
        isNewUser= false;
      }
      return Pair(Pair(userData, isNewUser), null);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return Pair(null, e.toString());
    } catch (e) {
      debugPrint(e.toString());
      return Pair(null, e.toString());
    }
  }

}
