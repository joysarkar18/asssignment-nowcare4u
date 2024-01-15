import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

Future<GoogleSignInAccount?> logIn() {
  return googleSignIn.signIn();
}

Future<GoogleSignInAccount?> logOut() => googleSignIn.signOut();
