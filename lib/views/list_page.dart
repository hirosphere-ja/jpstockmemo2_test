import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListPage'),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              title: Column(
                children: [
                  const Text('銘柄名'),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('(証券コード)'),
                      SizedBox(
                        width: 8,
                      ),
                      Text('市場'),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('メモ'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('登録日時：createdAt'),
                Text('更新日時：updatedAt'),
              ],
            ),
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
            ),
          ],
        ),
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
