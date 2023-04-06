import 'package:flutter/material.dart';
import 'ui/products/products_manager.dart';
import 'ui/products/products_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyShop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('MyShop'),
        //   ),
        //   body: const Center(
        //     child: Text('Wellcome to MyShop'),
        //   ),
        // ),
        home: SafeArea(
          child: ProductsDetailScreen(ProductsManager().items[0]),
        ));
  }
}
