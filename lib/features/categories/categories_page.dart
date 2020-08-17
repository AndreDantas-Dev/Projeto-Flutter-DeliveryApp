import 'dart:convert';

import 'package:delivery_app/common/app_colors.dart';
import 'package:delivery_app/common/default_background.dart';
import 'package:delivery_app/common/default_navigation.dart';
import 'package:delivery_app/common/search_textfield.dart';
import 'package:delivery_app/common/styles.dart';
import 'package:delivery_app/features/food/food_page.dart';
import 'package:delivery_app/models/category.dart';
import 'package:delivery_app/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool _loading = false;
  List<Category> _categories = [];
  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DefaultBackground(
            color: AppColors.defaultBackgroundColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DefaultNavigation(
                text: "Categories",
              ),
              SizedBox(
                height: 32,
              ),
              SearchTextField(),
              SizedBox(
                height: 16,
              ),
              _categories.isEmpty
                  ? SizedBox.shrink()
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          children: _categories
                              .map((category) => GridViewItem(
                                    callback: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => FoodPage(
                                                    category: category,
                                                  )));
                                    },
                                    category: category,
                                  ))
                              .toList(),
                        ),
                      ),
                    )
            ],
          ),
          _loading
              ? Center(child: CircularProgressIndicator())
              : SizedBox.shrink()
        ],
      ),
    );
  }

  _fetchCategories() {
    setState(() {
      _loading = true;
    });
    Service.getCategories().then((response) {
      var json = jsonDecode(response.body);
      _categories = [];
      for (var category in json["categories"]) {
        _categories.add(Category.fromMap(category));
      }
      setState(() {
        _loading = false;
      });
    });
  }
}

class GridViewItem extends StatelessWidget {
  final Category category;
  final Function callback;
  const GridViewItem({this.callback, Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.defaultBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7), topRight: Radius.circular(7)),
              child: Container(
                height: 64,
                width: double.infinity,
                child: Container(
                  height: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7)),
                      child: Image.network(
                        category.imageURL,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    category.title,
                    style: TextStyles.headerText(20),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "(${category.items.length})",
                    style: TextStyles.secondaryText(16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
