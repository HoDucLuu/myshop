import 'package:flutter/material.dart';
import 'ui/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartManager(),
        ),
      ],
      child: MaterialApp(
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
        home: const ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routerName: (ctx) => const OrderScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
        },
        onGenerateRoute: ((settings) {
          if (settings.name == ProductsDetailScreen.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return ProductsDetailScreen(
                  ProductsManager().findById(productId)!,
                );
              },
            );
          }
          return null;
        }),
      ),
      //
      // home: const SafeArea(
      //   child: OrderScreen(),
      // ),
    );
  }
}
