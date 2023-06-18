
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/features/loginandsignup/repository/login_signup_repository.dart';
import 'package:zomato_clone/models/pair.dart';
import 'package:zomato_clone/models/user.dart';

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

}