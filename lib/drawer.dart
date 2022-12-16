import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text('Drawer Sample'),
            ),
          ),
          ListTile(
              title: const Text("Trang chủ"),
              onTap: () => Navigator.pushNamed(context, '/')),
          ListTile(
              title: const Text("Hoa quả"),
              onTap: () => Navigator.pushNamed(context, '/fruit')),
          ListTile(
              title: const Text("Quần áo"),
              onTap: () => Navigator.pushNamed(context, '/clothes')),
          ListTile(
              title: const Text("Giỏ hàng"),
              onTap: () => Navigator.pushNamed(context, '/cart')),
        ],
      ),
    );
  }
}
