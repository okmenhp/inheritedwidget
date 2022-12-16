import 'package:flutter/material.dart';
import 'package:inheritedwidget/data/data.dart';
import 'package:inheritedwidget/drawer.dart';
import 'package:inheritedwidget/inherited.dart';

class Clothes extends StatefulWidget {
  const Clothes({super.key});

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  var cartItem;
  List<Item> listClothes = [
    Item(id: 11, item: "Áo dài", check: false),
    Item(id: 12, item: "Áo ngắn", check: false),
    Item(id: 13, item: "Quần dài", check: false),
    Item(id: 14, item: "Quần đùi", check: false),
  ];

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

  @override
  Widget build(BuildContext context) {
    cartItem = CartWidget.of(context);
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(title: const Text("Quần áo")),
      body: ListView.builder(
        itemCount: listClothes.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: listClothes[index].check,
            title: Text(listClothes[index].item),
            onChanged: (bool? value) {
              changeCheck(listClothes, index, value!);
              _addItemToCart(listClothes[index].id);
            },
          );
        },
      ),
    );
  }
}
