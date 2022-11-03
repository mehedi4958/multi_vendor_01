import 'package:flutter/material.dart';

class FullImageScreen extends StatefulWidget {
  const FullImageScreen({Key? key, required this.imageList}) : super(key: key);
  final List<dynamic> imageList;

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              '1/5',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView(
              children: List.generate(
                widget.imageList.length,
                (index) => Image.network(widget.imageList[index].toString()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
