import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  /// METHOD TO UPLOAD IMAGE TO STORAGE

  Future<String> _uploadImageToStorage(Uint8List? image) async {
    Reference reference =
        _firebaseStorage.ref().child('profile').child(_auth.currentUser!.uid);
    UploadTask uploadTask = reference.putData(image!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  /// METHOD TO PICK IMAGE FROM GALLERY OR CAMERS

  pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return file.readAsBytes();
    } else {
      print('No Image Selected');
    }
  }

  /// METHOD FOR SIGNUP USER

  Future<String> signUpUsers(
      String fullName, String email, String password, Uint8List? image) async {
    String res = 'some error occurred';
    try {
      if (fullName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String imageUrl = await _uploadImageToStorage(image);
        await _fireStore.collection('customers').doc(cred.user!.uid).set({
          'cid': cred.user!.uid,
          'fullName': fullName,
          'email': email,
          'image': imageUrl,
          'address': '',
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

  /// METHOD FOR USER SIGN IN

  Future<String> loginUsers(String email, String password) async {
    String res = 'some error occurred';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        print('Logged in successfully');
      } else {
        res = 'Fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
