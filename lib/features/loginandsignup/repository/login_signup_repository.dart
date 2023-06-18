import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zomato_clone/common/firebaseprovider/firebase_instance_provider.dart';
import 'package:zomato_clone/models/pair.dart';
import 'package:zomato_clone/models/user.dart';

final loginSignUpRepositoryProvider = Provider(
    (ref) => LoginSignUpRepository(auth: ref.watch(firebaseAuthProvider)));

class LoginSignUpRepository {
  final FirebaseAuth auth;

  LoginSignUpRepository({required this.auth});

  Future<Pair<Pair<UserData, bool>?, String?>> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
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
}
