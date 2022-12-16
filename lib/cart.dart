import 'package:flutter/material.dart';
import 'package:inheritedwidget/drawer.dart';
import 'package:inheritedwidget/inherited.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var carItem;
  @override
  Widget build(BuildContext context) {
    carItem = CartWidget.of(context);
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(title: const Text("Giỏ hàng")),
      body: Center(child: Text("${carItem.cart.list_item_id}")),
    );
  }
}
