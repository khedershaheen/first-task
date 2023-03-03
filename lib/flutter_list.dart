import 'package:flutter/material.dart';

class FlutterList extends StatefulWidget {
  const FlutterList({Key? key}) : super(key: key);

  @override
  State<FlutterList> createState() => _FlutterListState();
}

class _FlutterListState extends State<FlutterList> {
  final _items = [];

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, "Item ${_items.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          elevation: 10,
          color: Colors.purple,
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
          ),
        ),
      );
      ;
    }, duration: const Duration(seconds: 1));

    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter List'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: 0,
        padding: const EdgeInsets.all(10),
        itemBuilder: (_, index, animation) {
          return SizeTransition(
            key: UniqueKey(),
            sizeFactor: animation,
            child: Card(
              margin: const EdgeInsets.all(6),
              elevation: 10,
              color: Colors.purple,
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title:
                    Text(_items[index], style: const TextStyle(fontSize: 24)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _removeItem(index),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: _addItem,
          child: const Icon(Icons.add)),
    );
  }
}
