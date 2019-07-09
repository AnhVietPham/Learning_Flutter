import 'package:flutter/material.dart';

import './address_tag.dart';
import './price_tag.dart';
import '../../models/product.dart';
import '../ui_elements/title_default.dart';

class ProductCard extends StatelessWidget {
  final Product products;
  final int productIndex;

  ProductCard(this.products, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(products.title),
          SizedBox(width: 8.0),
          PriceTag(products.price.toString())
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Details'),
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + productIndex.toString()),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset(products.image),
        _buildTitlePriceRow(),
        AddressTag('HCM City'),
        _buildActionButton(context)
      ],
    ));
  }
}
