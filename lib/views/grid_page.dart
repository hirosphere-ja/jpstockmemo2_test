import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jpstockmemo2_test/components/custom_alert_dialog.dart';
import 'package:jpstockmemo2_test/components/stock_card.dart';
import 'package:jpstockmemo2_test/databases/tables.dart';
import 'package:jpstockmemo2_test/views/edit_page.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  late MemoDatabase _db;

  late List<Memo> memos = [];

  void _refreshMemos() async {
    _db = MemoDatabase();
    final data = await _db.getMemos();
    setState(() {
      memos = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshMemos();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bool isButtonMode = false;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
        title: const Text('GridPage'),
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: memos.length,
        itemBuilder: (context, index) => StockCard(
          isButtonMode: isButtonMode,
          stockname: memos[index].stockname,
          code: memos[index].code,
          market: "市場",
          memo: memos[index].memo,
          onDeleteChanged: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog(
                  title: "${memos[index].stockname}を削除しますか？",
                  buttonText: "OK",
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _db.deleteMemo(memos[index].id);
                    _refreshMemos();
                  },
                );
              },
            );
          },
          onEditChanged: () async {},
          createdAt: null,
          updatedAt: null,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditPage(),
            ),
          );
        },
        label: const Text('EditPage'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
