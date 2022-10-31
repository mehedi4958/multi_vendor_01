import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class MenGalleryScreen extends StatefulWidget {
  const MenGalleryScreen({Key? key}) : super(key: key);

  @override
  State<MenGalleryScreen> createState() => _MenGalleryScreenState();
}

class _MenGalleryScreenState extends State<MenGalleryScreen> {
  final Stream<QuerySnapshot> _productsStream =
      FirebaseFirestore.instance.collection('products').snapshots();

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

        return StaggeredGridView.countBuilder(
            itemCount: snapshot.data!.docs.length,
            crossAxisCount: 2,
            itemBuilder: (context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 100,
                        maxHeight: 250,
                      ),
                      child: Image.network(
                          snapshot.data!.docs[index]['productImages'][0]),
                    ),
                    Text(snapshot.data!.docs[index]['productName'])
                  ],
                ),
              );
            },
            staggeredTileBuilder: (context) => const StaggeredTile.fit(1));
        //   ListView(
        //   children: snapshot.data!.docs
        //       .map((DocumentSnapshot document) {
        //         Map<String, dynamic> data =
        //             document.data()! as Map<String, dynamic>;
        //         return ListTile(
        //           title: Text(data['productName']),
        //         );
        //       })
        //       .toList()
        //       .cast(),
        // );
      },
    );
  }
}
