import 'package:flutter/material.dart';
import './pages/auth.dart';
import 'package:flutter_app/pages/product_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _product = [];

  void _addProducts(Map<String, dynamic> product) {
    setState(() {
      _product.add(product);
      print(_product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _product.removeAt(index);
    });
  }

  void _updateProduct(int index, Map<String, dynamic> product) {
    setState(() {
      _product[index] = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        buttonColor: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_product),
        '/admin': (BuildContext context) => ProductsAdminPage(
            _addProducts, _updateProduct, _deleteProduct, _product),
      },
      onGenerateRoute: (RouteSettings setting) {
        final List<String> pathElements = setting.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _product[index]['title'],
                _product[index]['image'],
                _product[index]['price'],
                _product[index]['description']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_product));
      },
    );
  }
}
