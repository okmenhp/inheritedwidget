import 'package:flutter/material.dart';
import 'package:inheritedwidget/add.dart';
import 'package:inheritedwidget/cart.dart';
import 'package:inheritedwidget/clothes.dart';
import 'package:inheritedwidget/drawer.dart';
import 'package:inheritedwidget/fruit.dart';
import 'package:inheritedwidget/inherited.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CartWidget(
      cart: Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(title: 'Flutter Deomo'),
          '/fruit': (context) => const Fruit(),
          '/clothes': (context) => const Clothes(),
          '/cart': (context) => const CartPage(),
          '/add-item': (context) => const AddItemPage()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            MyText(counter: counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  // constructor để nhận data từ widget cha
  const MyText({super.key, required this.counter});
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
