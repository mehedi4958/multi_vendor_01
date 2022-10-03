import 'package:flutter/material.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({Key? key}) : super(key: key);

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: Colors.cyan,
                    child: const Center(
                      child: Text(
                        'You have not\n\nPicked any Image',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const Text('Category Here'),
                ],
              ),
              const SizedBox(
                height: 40,
                child: Divider(
                  color: Colors.cyan,
                  thickness: 1.6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Price',
                      hintText: 'Add Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      hintText: 'Add Quantity',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: TextFormField(
                    maxLength: 100,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      hintText: 'Enter product name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Product Description',
                      hintText: 'Write product description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
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
}
