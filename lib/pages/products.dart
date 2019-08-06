import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/products.dart';
import '../widgets/products/products.dart';

class ProductsPage extends StatelessWidget {
  Widget _buildSlideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductModel>(
      model: ProductModel(),
      child: Scaffold(
        drawer: _buildSlideDrawer(context),
        appBar: AppBar(
          title: Text("EasyList"),
        ),
        body: Products(),
      ),
    );
  }
}
