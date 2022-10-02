import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_vendor_01/firebase_options.dart';
import 'package:multi_vendor_01/views/auth/customer_login_screen.dart';
import 'package:multi_vendor_01/views/auth/landing_customer_screen.dart';
import 'package:multi_vendor_01/views/auth/landing_seller_screen.dart';
import 'package:multi_vendor_01/views/cart_screen.dart';
import 'package:multi_vendor_01/views/customer_home_screen.dart';
import 'package:multi_vendor_01/views/home_screen.dart';
import 'package:multi_vendor_01/views/inner_screens/search_screens.dart';
import 'package:multi_vendor_01/views/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Brand-Bold',
      ),
      initialRoute: LandingCustomerScreen.routeName,
      routes: {
        LandingCustomerScreen.routeName: (context) =>
            const LandingCustomerScreen(),
        LandingSellerScreen.routeName: (context) => const LandingSellerScreen(),
        CustomerLoginScreen.routeName: (context) => const CustomerLoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        CustomerHomeScreen.routeName: (context) => const CustomerHomeScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
      },
    );
  }
}
