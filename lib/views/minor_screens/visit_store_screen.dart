import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../widgets/product_model.dart';

class VisitStoreScreen extends StatelessWidget {
  const VisitStoreScreen({
    Key? key,
    required this.sellerUid,
  }) : super(key: key);

  final sellerUid;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> productsStream = FirebaseFirestore.instance
        .collection('products')
        .where('sellerUid', isEqualTo: sellerUid)
        .snapshots();

    CollectionReference sellers =
        FirebaseFirestore.instance.collection('sellers');

    return FutureBuilder<DocumentSnapshot>(
      future: sellers.doc(sellerUid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              elevation: 0,
              title: Text(
                data['storeName'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 6,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: StreamBuilder<QuerySnapshot>(
              stream: productsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.cyan,
                    ),
                  );
                }

                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'This Store\n\nhas no item yet',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    crossAxisCount: 2,
                    itemBuilder: (context, int index) {
                      return ProductModel(products: snapshot.data!.docs[index]);
                    },
                    staggeredTileBuilder: (context) =>
                        const StaggeredTile.fit(1));
              },
            ),
          );
        }

        return const Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
