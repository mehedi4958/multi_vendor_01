import 'package:flutter/material.dart';

class FullImageScreen extends StatefulWidget {
  const FullImageScreen({Key? key, required this.imageList}) : super(key: key);
  final List<dynamic> imageList;

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  final PageController _pageController = PageController();
  int index = 0;

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
          Center(
            child: Text(
              '${index + 1}/${widget.imageList.length}',
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: List.generate(
                widget.imageList.length,
                (index) => Image.network(widget.imageList[index].toString()),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.imageList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(index);
                      },
                      child: Image.network(widget.imageList[index]));
                }),
          ),
        ],
      ),
    );
  }
}
