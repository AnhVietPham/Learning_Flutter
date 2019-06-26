import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue;
  String descriptionValue;
  double priceValue;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Product Title'),
              onSaved: (String value) {
                setState(() {
                  titleValue = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description Title'),
              maxLines: 4,
              onSaved: (String value) {
                setState(() {
                  descriptionValue = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Price Title'),
              keyboardType: TextInputType.number,
              onSaved: (String value) {
                setState(() {
                  priceValue = double.parse(value);
                });
              },
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                formKey.currentState.save();
                final Map<String, dynamic> product = {
                  'title': titleValue,
                  'description': descriptionValue,
                  'price': priceValue,
                  'image': 'assets/android.jpg'
                };
                widget.addProduct(product);
                Navigator.pushReplacementNamed(context, '/products');
              },
            )
          ],
        ),
      ),
    );
  }
}
