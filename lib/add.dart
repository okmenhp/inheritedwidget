import 'package:flutter/material.dart';
import 'package:inheritedwidget/data/data.dart';
import 'package:inheritedwidget/inherited.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController myController =
      TextEditingController(); //Lấy dữ liệu từ TextFeild
  var cartITem;
  void _addItemToList() {
    setState(() {
      cartITem.cart.listFruit.add(Item(
          id: cartITem.cart.listFruit.length + 1,
          item: myController.text,
          check: false));
      Navigator.pushNamed(context, '/fruit');
    });
  }

  @override
  Widget build(BuildContext context) {
    cartITem = CartWidget.of(context); //Lấy dữ liệu từ inhherted
    return Scaffold(
      appBar: AppBar(title: const Text("Thêm vào danh sách")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: myController,
              decoration: const InputDecoration(labelText: "Nhập tên sản phẩm"),
            ),
            TextButton(
                onPressed: () {
                  _addItemToList();
                },
                child: const Text('Thêm'))
          ],
        ),
      ),
    );
  }
}
