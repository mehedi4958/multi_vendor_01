import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_01/controllers/snack_bar_controller.dart';
import 'package:multi_vendor_01/views/auth/landing_customer_screen.dart';
import 'package:multi_vendor_01/views/auth/landing_seller_screen.dart';
import 'package:multi_vendor_01/views/seller_home_screen.dart';

class SellerLoginScreen extends StatefulWidget {
  static const String routeName = 'SellerLoginScreen';
  const SellerLoginScreen({Key? key}) : super(key: key);

  @override
  State<SellerLoginScreen> createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  bool passwordObscurity = true;
  bool isLoading = false;

  void longin() async {
    setState(() {
      isLoading = true;
    });
    try {
      if (_formKey.currentState!.validate()) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });
        Navigator.of(context).pushNamedAndRemoveUntil(
            SellerHomeScreen.routeName, (route) => false);
      } else {
        setState(() {
          isLoading = false;
        });
        snackBar(context, 'Fields must not be empty');
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
                        'Sign in to Seller\'s Account',
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
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email must not be empty';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
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
                        onChanged: (value) {
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
                          longin();
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
                                    'Log in',
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
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, LandingSellerScreen.routeName);
                            },
                            child: const Text('Sign up'),
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
