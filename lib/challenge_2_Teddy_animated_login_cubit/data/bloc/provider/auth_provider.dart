// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*-----------------------------------------------------------------------------------------------*/
/*-------------------------------------- auth abstract class ------------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
abstract class AuthBase {
  User get currentUser;
//signInAnonymously();
  signOut();
  authStateChanges();
  signInWithGoogle();
  signInWithFacebook();
  signInWithEmailAndPassword(String email, String password);
  createUserWithEmailAndPassword(String email, String password);
}

/*-----------------------------------------------------------------------------------------------*/
/*-------------------------------------- auth functions class ------------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
class Auth implements AuthBase {
  /*---------------------------  firebaseAuth variable  ----------------------------*/
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => FirebaseAuth.instance.currentUser!;

// /*-----------------------------------------------------------------------------------------------*/
// /*-------------------------------------- sign in anonymously  ------------------------------------*/
// /*-----------------------------------------------------------------------------------------------*/
//   @override
//   Future <User> signInAnonymously() async{
//     final userCredential = await _firebaseAuth.signInAnonymously();
//     return userCredential.user;
//   }

/*-----------------------------------------------------------------------------------------------*/
/*------------------------------------- sign in email & pass  -----------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

/*-----------------------------------------------------------------------------------------------*/
/*------------------------------------- sign up email & pass  -----------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  @override
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

/*-----------------------------------------------------------------------------------------------*/
/*------------------------------------- sign in/up  with google  --------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<User?> signInWithGoogle() async {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final  authResult = await _firebaseAuth.signInWithCredential(credential);
 return authResult.user;



  
    // final googleSignIn = GoogleSignIn(
    //   scopes: [
    //     'mohamedkhalilalmasri@gmail.com',
    //     'https://www.googleapis.com/auth/contacts.readonly',
    //   ],
    // );
    // final googleUser = await googleSignIn.signIn();
    // if (googleUser != null) {
    //   final GoogleSignInAccount googleSignInAccount =
    //       await googleSignIn.signIn();
    //   final GoogleSignInAuthentication googleAuth =
    //       await googleUser.authentication;
    //   final AuthCredential credential = GoogleAuthProvider.getCredential(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );
    //     final  authResult = await _firebaseAuth.signInWithCredential(credential);

    //    return authResult.user;
    //   // if (googleAuth.idToken != null) {
    //   //   final userCredential = await _firebaseAuth
    //   //       .signInWithCredential(GoogleAuthProvider.credential(
    //   //     idToken: googleAuth.idToken,
    //   //     accessToken: googleAuth.accessToken,
    //   //   ));
    //   //   return userCredential.user;
    //   // } else {
    //   //   throw FirebaseAuthException(
    //   //       code: GlobalAppStrings.errorMissingGoogleIdToken,
    //   //       message: GlobalAppStrings.missingGoogleIdToken);
    //   // }
    // } else {
    //   throw FirebaseAuthException(
    //     code: GlobalAppStrings.errorAbortedByUser,
    //     message: GlobalAppStrings.signInAbortedByUser,
    //   );
    // }
  }


/*-----------------------------------------------------------------------------------------------*/
/*----------------------------------- sign in/up with facebook  ---------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
   @override
  Future<User?> signInWithFacebook() async {
    // final fb = FacebookLogin();
    // final response = await fb.logIn(permissions: [
    //   FacebookPermission.publicProfile,
    //   FacebookPermission.email,
    // ]);
    // switch (response.status) {
    //   case FacebookLoginStatus.success:
    //     final accessToken = response.accessToken;
    //     final userCredential = await _firebaseAuth.signInWithCredential(
    //         FacebookAuthProvider.credential(accessToken!.token));

    //     return userCredential.user;

    //   case FacebookLoginStatus.cancel:
    //     throw FirebaseAuthException(
    //         code: "Error Aborted by user", message: "Sign In Aborted by User");
    //   case FacebookLoginStatus.error:
    //     throw FirebaseAuthException(
    //       code: "Error Facebook Login Failed",
    //       message: response.error!.developerMessage,
    //     );
    //   default:
    //     throw UnimplementedError();
    // }
  }



/*-----------------------------------------------------------------------------------------------*/
/*---------------------------------------- logout function  -------------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    //final facebookLogin = FacebookLogin();
   // await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }
}
