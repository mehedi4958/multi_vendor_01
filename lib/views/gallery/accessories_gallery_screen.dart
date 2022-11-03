import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../widgets/product_model.dart';

class AccessoriesGalleryScreen extends StatefulWidget {
  const AccessoriesGalleryScreen({Key? key}) : super(key: key);

  @override
  State<AccessoriesGalleryScreen> createState() =>
      _AccessoriesGalleryScreenState();
}

class _AccessoriesGalleryScreenState extends State<AccessoriesGalleryScreen> {
  final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
      .collection('products')
      .where('mainCategory', isEqualTo: 'Accessories')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              'This Category\n\nhas no item yet',
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
            staggeredTileBuilder: (context) => const StaggeredTile.fit(1));
      },
    );
  }
}
