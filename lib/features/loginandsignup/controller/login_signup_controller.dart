import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/features/loginandsignup/repository/login_signup_repository.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/models/user.dart';

final loginSignUpControllerProvider = Provider((ref) => LoginSignUpController(ref.watch(loginSignUpRepositoryProvider)));

class LoginSignUpController{
  final LoginSignUpRepository repository;
  LoginSignUpController(this.repository);

  Future<Pair<Pair<UserData, bool>?, String?>> signInOrSignUpWithGoogle() async {
    return repository.signInOrSignUpWithGoogle();
  }

  Future<Pair<Pair<UserData, bool>?, String?>> signInOrSignUpWithFacebook() async {
    return repository.signInOrSignUpWithFacebook();
  }

  void signInOrSignUpWithPhone(String phoneNumber, Function(String, int?) verification) async {
    repository.signInWithPhone(phoneNumber, verification);
  }

  Future<bool> verifyOTP(String verificationId, String otp) async {
    return repository.verifyOTP(verificationId: verificationId, userOTP: otp);
  }

  Stream<int> getResendTime() async* {
    for(int i = 5; i>=0; i--){
      await Future<void>.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  bool get isUserSigned  => repository.isUserSignedIn();

}