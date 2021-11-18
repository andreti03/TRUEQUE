import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trueque/Controllers/controller.dart';


class AuthenticationController extends GetxController{
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  var storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  final _error = ''.obs;
  final Controller controller = Get.put(Controller());

  String get error => _error.value;

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
        'gender' : '',
        'num_products':''},
        SetOptions(merge: true)).then((_){
        print("success!");}
      );
      var doc = await users.doc(_auth.currentUser!.uid).get();
      if (doc.exists){
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
        return 'success';
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
      'image_path': userCred.user?.photoURL,
      'num_products':''},
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