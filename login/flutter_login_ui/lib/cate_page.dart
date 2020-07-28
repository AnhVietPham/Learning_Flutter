import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cate_page_bloc.dart';
import 'cate_page_model.dart';
import 'menu_item_widget.dart';

class CatePage extends StatefulWidget {
  @override
  _CatePageState createState() => _CatePageState();
}

class _CatePageState extends State<CatePage> {
  TextEditingController _findInCategoriesController = TextEditingController();
  CatePageBloc _catePageBloc = CatePageBloc();

  @override
  void initState() {
    super.initState();
    _catePageBloc.fetchCatePage();
    _findInCategoriesController.addListener(() {
      _catePageBloc.submitQuery(_findInCategoriesController.text);
    });
  }

  @override
  void dispose() {
    _catePageBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Container(
          child: Center(child: Text('Tat ca danh muc')),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              padding: EdgeInsets.all(16),
              child: TextFormField(
                controller: _findInCategoriesController,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Tìm kiếm trong danh mục',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<CatePageModel>>(
                  stream: _catePageBloc.catePageStream,
                  builder: (context, snapshot) {
                    return GridView.builder(
                        itemCount: snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final item = snapshot.data[index];
                          return Container(
                            padding: EdgeInsets.all(4),
                            child: MenuItemWidget(item.title, item.image),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
