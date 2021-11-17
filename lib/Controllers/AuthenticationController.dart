import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trueque/Controllers/controller.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:twitter_login/entity/auth_result.dart';
// import 'package:twitter_login/twitter_login.dart';


class AuthenticationController extends GetxController{
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  var storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  final _error = ''.obs;
  final Controller controller = Get.put(Controller());

  String get error => _error.value;

  // User? get currentUser => _auth.currentUser;

  Future<String?> signInWithEmailAndPassword({required String email, required String password}) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Inicio exitoso.';
    }on FirebaseAuthException catch(e){
      print(e.code);
      if (e.code == 'user-not-found'){
        return 'Usuario no encontrado.';
      }
      else if (e.code == 'wrong-password'){
        return 'Contraseña Incorrecta.';
      }
      else if (e.code == 'invalid-email'){
        return 'Correo Incorrecto.';
      }
    }
  }

  // Future<void> updateEmail({required String newEmail}){
  //   var credential = EmailAuthProvider.credential(email: _auth.currentUser!.email, password: password);
  //   _auth.currentUser?.updateEmail(newEmail);
  // }

  Future signUpWithEmailAndPassword({required String email, required String password, required String name}) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await users.doc(_auth.currentUser!.uid).set(
        {'name': name, 
        'email': email, 
        'id_number': '', 
        'phone': '', 
        'birth': '',
        'image_path': '',
        'date' : '',
        'gender' : ''},
        SetOptions(merge: true)).then((_){
        print("success!");}
      );
      var doc = await users.doc(_auth.currentUser!.uid).get();
      if (doc.exists){
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        var uploadTask = storage
                    .ref("Profile/avatar-png-green.png");
        var dowurl = await uploadTask.getDownloadURL();
        var imagePath = dowurl.toString();   
        await users.doc(_auth.currentUser!.uid).set(
            {'image_path': imagePath,
            'new': false},
            SetOptions(merge: true)).then((_){
            print("success!");}
        );
      }
    }on FirebaseAuthException catch(e){
        if (e.code == 'invalid-email'){
          _error.value = 'Ingrese un correo válido.';
          return 'Correo inválido.';
        }
      }
    }

  Future<String> signInWithGoogle() async{
  try{
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
    );
    UserCredential userCred = await FirebaseAuth.instance.signInWithCredential(credential);
    await users.doc(_auth.currentUser!.uid).set(
      {'name': userCred.user?.displayName, 
      'email': userCred.user?.email, 
      'id_number': '', 
      'phone': '', 
      'birth': '',
      'date': '', 
      'gender' : '',
      'image_path': userCred.user?.photoURL},
      SetOptions(merge: true)).then((_){
      print("success!");}
    );
    Map<String, String?> userInfo = {'displayName':userCred.user?.displayName, 'email':userCred.user?.email};
    // controller.changeImagePath(userCred.user?.photoURL);
    return userInfo.toString();
  }catch(e){
    return '';
  }
 }

 Future<void> signOut() async {
  await _auth.signOut();
  await _googleSignIn.signOut();
}
}


// Future<String?> signUp(
//   {required String email, required String password}) async{
//     try{
//       await _fbAuth.crea
//     }
//   }
// )


// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   UserCredential userCred = await FirebaseAuth.instance.signInWithCredential(credential);
//   print(userCred);
//   return userCred;
// }

// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();

//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }

// Future<UserCredential> signInWithTwitter() async {
//   // Create a TwitterLogin instance
//   final twitterLogin = new TwitterLogin(
//     apiKey: '<your consumer key>',
//     apiSecretKey:' <your consumer secret>',
//     redirectURI: '<your_scheme>://'
//   );

//   // Trigger the sign-in flow
//   final authResult = twitterLogin.login();

//   // Create a credential from the access token
//   final twitterAuthCredential = TwitterAuthProvider.credential(
//     accessToken: authResult.authToken!,
//     secret: authResult.authTokenSecret!,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
// }