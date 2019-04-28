import 'package:flutter/material.dart';
import './products.dart';
class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager(this.startingProduct);

  @override
  State<StatefulWidget> createState() {
    return ProductManagerState();
  }
}

class ProductManagerState extends State<ProductManager> {
  List<String> products = ['Food Tester'];

  @override
  void initState() {
    products.add(widget.startingProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                products.add("Anh Viet Pham");
                print(products);
              });
            },
            child: Text('AnhVietPham'),
          ),
        ),
        Products(products)
      ],
    );
  }
}
