import 'package:flutter/material.dart';
import 'package:preserve_scroll_pos/listview_pagestorage.dart';

final PageStorageBucket bucketGlobal = PageStorageBucket();

class PersistPageStoragePage extends StatelessWidget {
  const PersistPageStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persists even after popping!'),
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
      body: PageStorage(
        bucket: bucketGlobal,
        child: ListView.builder(
          key: const PageStorageKey<String>('persistPageKey'),
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
    );
  }
}
