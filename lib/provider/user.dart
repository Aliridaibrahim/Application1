import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:world_of_art/model/user.dart';


// class _user{
//   final String uid;
//
//   _user(this.uid);
//
//
//
// }
//var user = FirebaseAuth.instance.currentUser;




class AuthBase{

  UserModel _userFromFirebase( firebaseUser  ){
    return UserModel();
  }

  Future<void> registerWithEmailAndPassword(String email,String password) async{
    try{
      final authResult = await   FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print(e.toString());
      return false;
    }
  }


  Future<void> loginWithEmailAndPassword(String email,String password)async{
    try{
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    }catch (e) {
      print(e.toString());
      return false;
    }
  }


  Future<void> logout()async{
   try{
     await FirebaseAuth.instance.signOut();
   }catch (e) {
     print(e.toString());
     return false;
   }
  }
  //Google auth
  Future<UserCredential> signWithGoogle() async {
   try {
     final GoogleSignInAccount googleUser =
     await GoogleSignIn(scopes: <String>["email"]).signIn();

     final GoogleSignInAuthentication googleAuth =
     await googleUser.authentication;

     final GoogleAuthCredential credential = GoogleAuthProvider.credential(
       accessToken: googleAuth.accessToken,
       idToken: googleAuth.idToken,
     );


     return await FirebaseAuth.instance.signInWithCredential(credential);
   }catch (e) {
     print(e.toString());
   }
  }
//facebook auth
  Future<UserCredential> signInWithFacebook() async {
  try{
    final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;

    final FacebookAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(result.token);

    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }catch (e) {
    print(e.toString());
  }
  }


}

// class AuthBase{
//
//   void _userFromFirebase(User){
//     return User();
//   }
//
//   Future<void> registerWithemailAndPassword(String email,String password) async {
//     await Firebase.initializeApp();
//     try {
//
//       final User user = (await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password))
//           .user;
//       return _userFromFirebase(user.uid);
//     } catch (e) {
//       print(e.message);
//
//     };
//   }
// }



