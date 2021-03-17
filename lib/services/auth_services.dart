import 'package:demo/functions/ServerResponse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authontication {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  void getCurrentUser() {
    final user = _auth.currentUser;
  }

  signInIntoExistingAcc({String email, String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<ServerResponse> loginWithEmail({
    String email,
    String password,
  }) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // User user = FirebaseAuth.instance.currentUser;

      return ServerResponse(
          payload: newUser,
          message: 'registration completed',
          extraInfo: DataInfo.TrueSuccess);
      print(newUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'unknown') {
        ServerResponse(
          message: 'firebase exception',
          extraInfo: DataInfo.ExceptionError,
        );
        print('No user found for that email.');
      }
    } catch (e) {}
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
