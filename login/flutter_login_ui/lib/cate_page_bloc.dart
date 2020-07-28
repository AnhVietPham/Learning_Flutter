import 'dart:async';

import 'package:flutterloginui/bloc.dart';

import 'cate_page_model.dart';

class CatePageBloc implements Bloc {
  final _catePageController = StreamController<List<CatePageModel>>();

  Stream<List<CatePageModel>> get catePageStream => _catePageController.stream;

  List<CatePageModel> dataBanners = [
    CatePageModel(
        'Anh Viet Pham',
        'Bách Hóa Tổng Hợp'),
    CatePageModel(
        'Anh Viet Pham',
        'Thời trang nữ'),
    CatePageModel(
        'Anh Viet Pham',
        'Thời trang nam'),
    CatePageModel(
        'Anh Viet Pham',
        'Sức khỏe & Làm đẹp'),
    CatePageModel('Anh Viet Pham',
        'Phụ kiện công nghệ'),
    CatePageModel('Anh Viet Pham',
        'Laptop, Máy tính & Thiết bị văn phòng'),
    CatePageModel(
        'Anh Viet Pham', 'Mẹ và bé'),
    CatePageModel(
        'Anh Viet Pham', 'Giày dép'),
    CatePageModel(
        'Anh Viet Pham', 'Túi xách'),
    CatePageModel(
        'Anh Viet Pham',
        'Dịch Vụ Tiện Ích'),
    CatePageModel('Anh Viet Pham', 'Đồng hồ'),
    CatePageModel(
        'Anh Viet Pham', 'Trang sức'),
    CatePageModel(
        'Anh Viet Pham', 'Thời trang trẻ em'),
  ];

  void fetchCatePage() {
    _catePageController.sink.add(dataBanners);
  }

  void submitQuery(String query) {
    if (query.isEmpty || query == null) {
      _catePageController.sink.add(dataBanners);
    } else {
      final resultQuery = dataBanners
          .where((element) => element.title.contains(query))
          .toList();
      _catePageController.sink.add(resultQuery);
    }
  }

  @override
  void dispose() {
    _catePageController.close();
  }
}
