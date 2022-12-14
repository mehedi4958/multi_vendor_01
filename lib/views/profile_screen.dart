import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_01/views/cart_screen.dart';
import 'package:multi_vendor_01/views/inner_screens/customer_order_screen.dart';
import 'package:multi_vendor_01/views/wishlist_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'ProfileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference customer =
        FirebaseFirestore.instance.collection('customers');
    return FutureBuilder(
      future: customer.doc(auth.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('something went wrong');
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text('Document does not exist');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  //backgroundColor: Colors.white,
                  expandedHeight: 140,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) => FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        opacity: constraints.biggest.height <= 120 ? 1 : 0,
                        duration: const Duration(milliseconds: 400),
                        child: const Text('Account'),
                      ),
                      background: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.cyan,
                              Colors.black26,
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            CircleAvatar(
                              backgroundColor: Colors.black87,
                              radius: 50,
                              backgroundImage: NetworkImage('${data['image']}'),
                            ),
                            const SizedBox(width: 25),
                            Text(
                              '${data['fullName']}',
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const CartScreen();
                                      },
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Center(
                                    child: Text(
                                      'Cart',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.cyan,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const CustomerOrderScreen();
                                      },
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Center(
                                    child: Text(
                                      'Order',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const WishListScreen();
                                      },
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Center(
                                    child: Text(
                                      'Wishlist',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const RepeatedDivider(title: 'Account Info'),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 280,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              RepeatedListTile(
                                title: 'Email Address',
                                subtitle: '${data['email']}',
                                leading: Icons.email,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.cyan,
                                  thickness: 1.6,
                                ),
                              ),
                              RepeatedListTile(
                                title: 'Phone No',
                                subtitle: '${data['phone']}',
                                leading: Icons.phone,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.cyan,
                                  thickness: 1.6,
                                ),
                              ),
                              RepeatedListTile(
                                  title: 'Address',
                                  subtitle: '${data['address']}',
                                  leading: Icons.location_pin)
                            ],
                          ),
                        ),
                      ),
                      const RepeatedDivider(title: 'Account Settings'),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 280,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: const [
                              RepeatedListTile(
                                title: 'Edit Profile',
                                subtitle: '',
                                leading: Icons.edit,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.cyan,
                                  thickness: 1.6,
                                ),
                              ),
                              RepeatedListTile(
                                title: 'Change Password',
                                subtitle: '',
                                leading: Icons.lock,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.cyan,
                                  thickness: 1.6,
                                ),
                              ),
                              RepeatedListTile(
                                title: 'Logout',
                                subtitle: '',
                                leading: Icons.logout,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.cyan,
          ),
        );
      },
    );
  }
}

class RepeatedDivider extends StatelessWidget {
  const RepeatedDivider({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
          width: 50,
          child: Divider(
            color: Colors.cyan,
            thickness: 1.6,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 40,
          width: 50,
          child: Divider(
            color: Colors.cyan,
            thickness: 1.6,
          ),
        ),
      ],
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  const RepeatedListTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.leading})
      : super(key: key);

  final String title;
  final String subtitle;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(
        leading,
        color: Colors.cyan,
      ),
    );
  }
}
