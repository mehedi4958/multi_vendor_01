import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
                          onPressed: () {},
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
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
                          onPressed: () {},
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
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
                          onPressed: () {},
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 40,
                      width: 50,
                      child: Divider(
                        color: Colors.cyan,
                        thickness: 1.6,
                      ),
                    ),
                    Text(
                      'Account info',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 50,
                      child: Divider(
                        color: Colors.cyan,
                        thickness: 1.6,
                      ),
                    ),
                  ],
                ),
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
                        ListTile(
                          title: Text('Email Address'),
                          subtitle: Text('m@mail.com'),
                          leading: Icon(
                            Icons.email,
                            color: Colors.cyan,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.cyan,
                            thickness: 1.6,
                          ),
                        ),
                        ListTile(
                          title: Text('Phone no'),
                          subtitle: Text('0123456789'),
                          leading: Icon(
                            Icons.phone,
                            color: Colors.cyan,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.cyan,
                            thickness: 1.6,
                          ),
                        ),
                        ListTile(
                          title: Text('Address'),
                          subtitle: Text('abc ABC'),
                          leading: Icon(
                            Icons.location_pin,
                            color: Colors.cyan,
                          ),
                        ),
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
}
