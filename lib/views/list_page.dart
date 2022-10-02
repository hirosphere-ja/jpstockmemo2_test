import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('ListPage'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/editpage');
            },
            child: const Text('EditPage'),
          )
        ],
      ),
    );
  }
}
