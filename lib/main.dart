import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_vendor_01/firebase_options.dart';
import 'package:multi_vendor_01/provider/cart_provider.dart';
import 'package:multi_vendor_01/provider/wishlist_provider.dart';
import 'package:multi_vendor_01/views/auth/customer_login_screen.dart';
import 'package:multi_vendor_01/views/auth/landing_customer_screen.dart';
import 'package:multi_vendor_01/views/auth/landing_seller_screen.dart';
import 'package:multi_vendor_01/views/auth/seller_login_screen.dart';
import 'package:multi_vendor_01/views/cart_screen.dart';
import 'package:multi_vendor_01/views/customer_home_screen.dart';
import 'package:multi_vendor_01/views/dashboard_screen.dart';
import 'package:multi_vendor_01/views/home_screen.dart';
import 'package:multi_vendor_01/views/inner_screens/search_screens.dart';
import 'package:multi_vendor_01/views/profile_screen.dart';
import 'package:multi_vendor_01/views/seller_home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return CartProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return WishListProvider();
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      initialRoute: SellerHomeScreen.routeName,
      routes: {
        LandingCustomerScreen.routeName: (context) =>
            const LandingCustomerScreen(),
        LandingSellerScreen.routeName: (context) => const LandingSellerScreen(),
        CustomerLoginScreen.routeName: (context) => const CustomerLoginScreen(),
        SellerLoginScreen.routeName: (context) => const SellerLoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        CustomerHomeScreen.routeName: (context) => const CustomerHomeScreen(),
        SellerHomeScreen.routeName: (context) => const SellerHomeScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
      },
    );
  }
}
