import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {

/*　引数の詳細
isButtonMode：編集・削除の操作をボタンかジェスチャーか変更するためのトリガー引数
true => ボタン、false => ジェスチャー
stockname   ：銘柄名
code        ：証券コード
market      ：市場
memo        ：メモ
createdAt   ：新規日時
updatedAt   ：更新日時
*/

  final bool isButtonMode;
  final String? stockname;
  final int? code;
  final String? market;
  final String? memo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const StockCard({
    super.key,
    required this.isButtonMode,
    required this.stockname,
    required this.code,
    required this.market,
    required this.memo,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: !isButtonMode
          ? () {
              debugPrint('長押しされました');
              // メモを削除する
            }
          : null,
      onDoubleTap: !isButtonMode
          ? () {
              debugPrint('ダブルタップされました');
              // 編集画面に遷移させる
            }
          : null,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              title: Column(
                children: [
                  Text(stockname!),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('($code)'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(market!),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(memo!),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('登録日時：$createdAt'),
                Text('更新日時：$updatedAt'),
              ],
            ),
            isButtonMode
                ?
                ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                        ),
                        icon: const Icon(Icons.edit),
                        label: const Text('編集'),
                        onPressed: () {},
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: const StadiumBorder(),
                        ),
                        icon: const Icon(Icons.delete),
                        label: const Text('削除'),
                        onPressed: () {},
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 8,
                  ),
          ],
        ),
      ),
    );
  }
}