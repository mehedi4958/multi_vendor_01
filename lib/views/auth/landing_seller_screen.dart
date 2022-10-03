import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor_01/controllers/auth_controller.dart';
import 'package:multi_vendor_01/controllers/snack_bar_controller.dart';
import 'package:multi_vendor_01/views/auth/landing_customer_screen.dart';
import 'package:multi_vendor_01/views/auth/seller_login_screen.dart';

class LandingSellerScreen extends StatefulWidget {
  static const String routeName = "LandingSellerScreen";
  const LandingSellerScreen({Key? key}) : super(key: key);

  @override
  State<LandingSellerScreen> createState() => _LandingSellerScreenState();
}

class _LandingSellerScreenState extends State<LandingSellerScreen> {
  final _authController = AuthController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String storeName;
  late String email;
  late String password;
  bool passwordObscurity = true;
  bool isLoading = false;

  Uint8List? _image;

  pickImageFromGallery() async {
    Uint8List img = await _authController.pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  pickImageFromCamera() async {
    Uint8List img = await _authController.pickImage(ImageSource.camera);
    setState(() {
      _image = img;
    });
  }

  Future<String> _uploadImageToStorage(Uint8List? image) async {
    Reference reference =
        _firebaseStorage.ref().child('profile').child(storeName);
    UploadTask uploadTask = reference.putData(image!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void signUp() async {
    setState(() {
      isLoading = true;
    });
    try {
      if (_image != null) {
        if (_formKey.currentState!.validate()) {
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password);
          String imageUrl = await _uploadImageToStorage(_image);
          await _firestore
              .collection('sellers')
              .doc(_firebaseAuth.currentUser!.uid)
              .set({
            'sid': _firebaseAuth.currentUser!.uid,
            'storeName': storeName,
            'email': email,
            'address': '',
            'imageUrl': imageUrl,
          }).whenComplete(() {
            setState(() {
              isLoading = false;
            });
          });
          _formKey.currentState!.reset();
          setState(() {
            _image = null;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          snackBar(context, 'Fields must not be empty');
        }
      } else {
        setState(() {
          isLoading = false;
        });
        snackBar(context, 'Please, pick an image');
      }
    } on FirebaseAuthException catch (exception) {
      setState(() {
        isLoading = false;
      });
      snackBar(context, exception.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Create Seller\'s Account',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Brand-Regular',
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.cyan,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.cyan,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : const CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.cyan,
                            ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pickImageFromCamera();
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pickImageFromGallery();
                              },
                              icon: const Icon(
                                Icons.photo,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Store name must not be empty';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (String value) {
                          storeName = value;
                        },
                        decoration: InputDecoration(
                          label: const Text('Store Name'),
                          hintText: 'Enter store name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email must not be empty';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (String value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password must not be empty';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (String value) {
                          password = value;
                        },
                        obscureText: passwordObscurity,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordObscurity = !passwordObscurity;
                              });
                            },
                            icon: passwordObscurity
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          label: const Text('Password'),
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          signUp();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SellerLoginScreen.routeName);
                            },
                            child: const Text('Login'),
                          )
                        ],
                      ),
                      const Text(
                        'Or',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Create a Customer\'s Account',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, LandingCustomerScreen.routeName);
                            },
                            child: const Text('Sign up'),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
