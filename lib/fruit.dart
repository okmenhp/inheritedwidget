import 'package:flutter/material.dart';
import 'package:inheritedwidget/data/data.dart';
import 'package:inheritedwidget/drawer.dart';
import 'package:inheritedwidget/inherited.dart';

class Fruit extends StatefulWidget {
  const Fruit({super.key});

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  var cartItem;
  // List<Item> listFruit = [
  //   Item(id: 1, item: "Dâu", check: false),
  //   Item(id: 2, item: "Cam", check: false),
  //   Item(id: 3, item: "Táo", check: false),
  //   Item(id: 4, item: "Bưởi", check: false),
  // ];

  void changeCheck(List<Item> listFruit, int index, bool checked) {
    setState(() {
      listFruit[index].check = checked;
    });
  }

  void _addItemToCart(int itemId) {
    setState(() {
      cartItem.cart.addItemToCart(itemId);
    });
  }

  void _removeItemToCart(int itemId) {
    setState(() {
      cartItem.cart.removeItemToCart(itemId);
    });
  }

  void _removeItemFromList(int itemId) {
    setState(() {
      cartItem.cart.listFruit.removeWhere((item) => item.id == itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lấy giá trị từ CartWidget
    cartItem = CartWidget.of(context);
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text("Hoa quả"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/add-item");
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: cartItem.cart.listFruit.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      value: cartItem.cart.listFruit[index].check,
                      title: Text(cartItem.cart.listFruit[index].item),
                      onChanged: (bool? value) {
                        // print(value);
                        changeCheck(cartItem.cart.listFruit, index, value!);
                        if (value == true) {
                          _addItemToCart(cartItem.cart.listFruit[index].id);
                        } else {
                          _removeItemToCart(cartItem.cart.listFruit[index].id);
                        }
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _removeItemFromList(cartItem.cart.listFruit[index].id);
                      },
                      child: const Text('Xóa'))
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
