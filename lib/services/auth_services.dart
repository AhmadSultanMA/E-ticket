part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSingUpResult> signUp(
      String email,
      String password,
      String name,
      List<String> selectedGenres,
      String selectedLanguange) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguange: selectedLanguange);

      await UserServices.updateUser(user);

      return SignInSingUpResult(user: user);
    } catch (e) {
      return SignInSingUpResult(message: e.toString());
    }
  }
}

class SignInSingUpResult {
  final User user;
  final String message;

  SignInSingUpResult({this.user, this.message});
}
