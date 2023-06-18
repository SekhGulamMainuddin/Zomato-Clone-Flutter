import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zomato_clone/common/firebaseprovider/firebase_instance_provider.dart';
import 'package:zomato_clone/models/pair.dart';
import 'package:zomato_clone/models/user.dart';

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

  // Future<Pair<Pair<UserData, bool>?, String?>> signInOrSignUpWithPhone() async {
  //   try{
  //     final credential = await _firebaseAuth.signInWithEmailLink(email: email, emailLink: emailLink)
  //   } catch (e) {
  //     return Pair(null, e.toString());
  //   }
  // }

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
