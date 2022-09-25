import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUsers(
      String fullName, String email, String password) async {
    String res = 'some error occurred';
    try {
      if (fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'fullName': fullName,
          'email': email,
        });
        res = 'success';
        print('Account Created');
      } else {
        res = 'Fields must not be empty.';
        print('Fields must not be empty.');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
