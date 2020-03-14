import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductModel extends Model {
  List<Product> _product = [];

  List<Product> get products {
    return List.from(_product);
  }

  void addProducts(Product product) {
    _product.add(product);
    print(_product);
  }

  void deleteProduct(int index) {
    _product.removeAt(index);
  }

  void updateProduct(int index, Product product) {
    _product[index] = product;
  }
}
