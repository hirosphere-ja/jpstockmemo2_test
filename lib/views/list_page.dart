import 'package:flutter/material.dart';
import 'package:jpstockmemo2/components/custom_alert_dialog.dart';
import 'package:jpstockmemo2/components/stock_card.dart';
import 'package:jpstockmemo2/databases/tables.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late MemoDatabase _db;
  @override
  void initState() {
    super.initState();
    _db = MemoDatabase();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bool isButtonMode = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListPage'),
      ),
      body: FutureBuilder<List<Memo>>(
        future: _db.getMemos(),
        builder: (context, snapshot) {
          final List<Memo>? memos = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          if (memos != null) {
            final listTiles = memos
                .map(
                  (memo) => StockCard(
                    isButtonMode: isButtonMode,
                    stockname: memo.stockname.toString(),
                    code: memo.code,
                    market: "市場",
                    memo: "メモ",
                    onDeleteChanged: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            title: "${memo.stockname}を削除しますか？",
                            buttonText: "OK",
                            onPressed: () async {
                              Navigator.of(context).pop();
                              await _db.deleteMemo(memo.code);
                            },
                          );
                        },
                      );
                    },
                    onEditChanged: () async {},
                    createdAt: null,
                    updatedAt: null,
                  ),
                )
                .toList();
            return ListView(
              children: listTiles,
            );
          }
          // );
          return const Text('No Data');
        },
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
