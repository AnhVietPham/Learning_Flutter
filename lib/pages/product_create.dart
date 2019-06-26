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
  final GlobalKey<FormState> fromState = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        setState(() {
          titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description Title'),
      maxLines: 4,
      onSaved: (String value) {
        setState(() {
          descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price Title'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    fromState.currentState.save();
    final Map<String, dynamic> product = {
      'title': titleValue,
      'description': descriptionValue,
      'price': priceValue,
      'image': 'assets/android.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWith = MediaQuery.of(context).size.width;
    final double targetWith = deviceWith > 550.0 ? 500.0 : deviceWith * 0.95;
    final double targetPadding = deviceWith - targetWith;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: fromState,
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: _submitForm,
              )
            ]),
      ),
    );
  }
}
