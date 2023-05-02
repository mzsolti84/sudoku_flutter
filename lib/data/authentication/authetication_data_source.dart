
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

@lazySingleton
class AuthenticationDataSource {
  Future<String> login({required String email, required String password}) async {
    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return result.user!.uid;
  }

  Future<String> loginAnonymously() async {
    var result = await FirebaseAuth.instance.signInAnonymously();
    return result.user!.uid;
  }

  Future<String?> isUserLoggedIn() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return currentUser.uid;
    } else {
      return null;
    }
  }

  Future<String> singUp({required String email, required String password}) async {
    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return result.user!.uid;
  }

}

