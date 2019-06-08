import 'package:flutter/material.dart';
import './price_tag.dart';
import '../ui_elements/title_default.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> products;
  final int productIndex;

  ProductCard(this.products, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset(products['image']),
        Container(
          margin: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleDefault(products['title']),
              SizedBox(width: 8.0),
              PriceTag(products['price'].toString())
            ],
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Details'),
              onPressed: () => Navigator.pushNamed<bool>(
                  context, '/product/' + productIndex.toString()),
            )
          ],
        )
      ],
    ));
  }
}
