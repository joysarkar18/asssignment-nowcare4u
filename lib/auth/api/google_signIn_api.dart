import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

Future<bool> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;

    // Use the user object for further operations or navigate to a new screen.
    if (user != null) {
      print("login successful");
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
