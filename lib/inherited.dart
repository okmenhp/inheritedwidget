import 'package:flutter/cupertino.dart';
import 'package:inheritedwidget/data/data.dart';

class CartWidget extends InheritedWidget {
  @override
  final Widget child;
  final Cart? cart;

  const CartWidget({Key? key, this.cart, required this.child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CartWidget? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CartWidget>());
  }
}

class Cart {
  List<int> list_item_id = [];
  List<Item> listFruit = [
    Item(id: 1, item: "Cam", check: false),
    Item(id: 2, item: "Táo", check: false),
    Item(id: 3, item: "Xoài", check: false),
    Item(id: 4, item: "Mít", check: false),
    Item(id: 5, item: "Nho", check: false)
  ];
  addItemToCart(int itemId) {
    list_item_id.add(itemId);
  }

  removeItemToCart(int itemId) {
    list_item_id.removeWhere((element) => element == itemId);
  }
}
