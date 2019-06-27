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
  final Map<String, dynamic> fromData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/android.jpg'
  };
  final GlobalKey<FormState> fromState = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is required';
        }
      },
      onSaved: (String value) {
        fromData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description Title'),
      maxLines: 4,
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Title is required and should be 10+ charactor long';
        }
      },
      onSaved: (String value) {
        fromData['description'] = value;
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price Title'),
      keyboardType: TextInputType.number,
//      validator: (String value) {
//        if (value.isEmpty ||
//            RegExp(r'^(?:[1-9]\d*|0)?(?:[.,]\d+)?$').hasMatch(value)) {
//          return 'Price is required and should be a number';
//        }
//      },
      onSaved: (String value) {
        fromData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!fromState.currentState.validate()) {
      return;
    }
    fromState.currentState.save();
    widget.addProduct(fromData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWith = MediaQuery.of(context).size.width;
    final double targetWith = deviceWith > 550.0 ? 500.0 : deviceWith * 0.95;
    final double targetPadding = deviceWith - targetWith;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
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
      ),
    );
  }
}
