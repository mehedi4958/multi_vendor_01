import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerOrderScreen extends StatefulWidget {
  const CustomerOrderScreen({Key? key}) : super(key: key);

  @override
  State<CustomerOrderScreen> createState() => _CustomerOrderScreenState();
}

class _CustomerOrderScreenState extends State<CustomerOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('cid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.cyan,
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black87),
            title: const Text(
              'Orders',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var order = snapshot.data!.docs[index];
              return ExpansionTile(
                title: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(order['orderImage']),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['orderName'],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                order['orderPrice'].toStringAsFixed(2),
                                style: const TextStyle(
                                  color: Colors.cyan,
                                ),
                              ),
                              Text('x ${order['orderQuantity']}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'See More...',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      order['deliveryStatus'],
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.cyan.withOpacity(0.2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${order['customerName']}'),
                        Text('Email: ${order['email']}'),
                        Text('Phone: ${order['phone']}'),
                        Text('Address: ${order['address']}'),
                        Text('Payment Status: ${order['paymentStatus']}'),
                        Text('Delivery Status: ${order['deliveryStatus']}'),
                        Text(
                            'Estimated Delivery Date: ${order['deliveryDate']}'),
                        order['deliveryStatus'] == 'delivered' &&
                                order['orderReview'] == false
                            ? TextButton(
                                onPressed: () {},
                                child: const Text('Write Review'),
                              )
                            : const Text(''),
                        order['deliveryStatus'] == 'delivered' &&
                                order['orderReview'] == true
                            ? Row(
                                children: const [
                                  Text(
                                    'Review Added',
                                    style: TextStyle(
                                      color: Colors.cyan,
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.green,
                                  ),
                                ],
                              )
                            : const Text(''),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
