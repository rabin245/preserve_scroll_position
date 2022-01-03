import 'package:flutter/material.dart';

class PageStoragePage extends StatefulWidget {
  const PageStoragePage({Key? key}) : super(key: key);

  @override
  State<PageStoragePage> createState() => _PageStoragePageState();
}

class _PageStoragePageState extends State<PageStoragePage> {
  int currentPage = 0;

  List<Widget> bodyList = [
    ListView.builder(
      // pagestoragekey stores the state of page when switching between the bottom navbar screens (in this case)
      // for navigator.push it works either way
      key: const PageStorageKey<String>('pageKey'),
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    ),
    const Center(
      child: Text(
        'Other Page',
        style: TextStyle(fontSize: 25),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Storage Key'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PageStoragePage()),
              );
            },
            icon: const Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: bodyList[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'other page',
          ),
        ],
      ),
    );
  }
}
