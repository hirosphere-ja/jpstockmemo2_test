import 'package:flutter/material.dart';
import 'package:jpstockmemo2/components/custom_text_form_field.dart';

class EditPage extends StatelessWidget {
  EditPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditPage'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              controller: _codeController,
              labelText: '証券コード',
              maxLines: 1,
              maxLength: 4,
              onChanged: null,
              validator: (value) {
                if (value.isEmpty) {
                  return '証券コードを入力してください';
                } else if (!RegExp(r"\d{4}").hasMatch(value)) {
                  return '４桁の半角数字を入力してください';
                }
              },
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              controller: _nameController,
              labelText: '銘柄名',
              maxLines: 1,
              maxLength: null,
              onChanged: null,
              validator: (value) {
                if (value.isEmpty) {
                  return '銘柄名を入力してください';
                }
              },
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                  }
                },
                child: const Text(
                  '保存',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
