import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_01/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedRadioButton = 0;
  @override
  Widget build(BuildContext context) {
    double totalPrice = Provider.of<CartProvider>(context).totalPrice;
    double totalPaid = totalPrice + 10;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    CollectionReference customer =
        FirebaseFirestore.instance.collection('customers');
    return FutureBuilder(
      future: customer.doc(_auth.currentUser!.uid).get(),
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
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey.shade200,
              appBar: AppBar(
                backgroundColor: Colors.grey.shade200,
                elevation: 0,
                title: const Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  totalPrice.toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Shipping Cost',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 2,
                              color: Colors.cyan,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Paid',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  totalPaid.toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            RadioListTile(
                              value: 1,
                              groupValue: selectedRadioButton,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedRadioButton = value!;
                                });
                              },
                              title: const Text('Cash On Delivery'),
                              subtitle: const Text('Payment From Home'),
                            ),
                            RadioListTile(
                              value: 2,
                              groupValue: selectedRadioButton,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedRadioButton = value!;
                                });
                              },
                              title: const Text('Pay With Card'),
                            ),
                            RadioListTile(
                              value: 3,
                              groupValue: selectedRadioButton,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedRadioButton = value!;
                                });
                              },
                              title: const Text('Pay With Stripe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomSheet: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if (selectedRadioButton == 1) {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        'Payment From Anywhere',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.90,
                                        decoration: BoxDecoration(
                                          color: Colors.cyan,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {},
                                          child: Center(
                                            child: Text(
                                              'Pay ${totalPaid.toStringAsFixed(2)} Now',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Center(
                          child: Text(
                            'Confirm Payment ${totalPaid.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Material(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.cyan,
            ),
          ),
        );
      },
    );
  }
}
