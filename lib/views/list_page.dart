import 'package:flutter/material.dart';
import 'package:jpstockmemo2/components/stock_card.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const bool isButtonMode = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListPage'),
      ),
      body: ListView(
        children: const [
          StockCard(
            isButtonMode: isButtonMode,
            stockname: "銘柄名1",
            code: 1234,
            market: "市場1",
            memo: "メモ1",
            createdAt: null,
            updatedAt: null,
          ),
          StockCard(
            isButtonMode: isButtonMode,
            stockname: "銘柄名2",
            code: 5678,
            market: "市場2",
            memo: "メモ2",
            createdAt: null,
            updatedAt: null,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/editpage');
        },
        label: const Text('EditPage'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
