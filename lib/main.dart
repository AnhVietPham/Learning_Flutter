import 'package:flutter/material.dart';
import './pages/auth.dart';
import './assignment_2/product_admin.dart';
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
  List<Map<String, String>> _product = [];

  void _addProducts(Map<String, String> product) {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      initialRoute: 'authPage',
      routes: {
        'authPage': (BuildContext context) => AuthPage(),
        '/': (BuildContext context) =>
            ProductsPage(_product, _addProducts, _deleteProduct),
        '/admin': (BuildContext context) => ProductsAdminPage(),
      },
      onGenerateRoute: (RouteSettings setting) {
        final List<String> pathElements = setting.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) =>
                ProductPage(_product[index]['title'], _product[index]['image']),
          );
        }
        return null;
      },
    );
  }
}
