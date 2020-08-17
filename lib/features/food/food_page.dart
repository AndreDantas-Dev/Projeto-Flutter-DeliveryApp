import 'package:delivery_app/common/app_colors.dart';
import 'package:delivery_app/common/default_background.dart';
import 'package:delivery_app/common/default_navigation.dart';
import 'package:delivery_app/common/search_textfield.dart';
import 'package:delivery_app/common/styles.dart';
import 'package:delivery_app/features/item/item_page.dart';
import 'package:delivery_app/models/category.dart';
import 'package:delivery_app/models/food_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  final Category category;

  const FoodPage({Key key, this.category}) : super(key: key);
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
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
                text: widget.category.title,
              ),
              SizedBox(
                height: 32,
              ),
              SearchTextField(),
              SizedBox(
                height: 16,
              ),
              widget.category.items.isEmpty
                  ? SizedBox.shrink()
                  : Expanded(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                          itemCount: widget.category.items.length,
                          itemBuilder: (context, index) {
                            return FoodListItem(
                              foodItem: widget.category.items[index],
                              callback: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ItemPage(
                                    item: widget.category.items[index],
                                  ),
                                ));
                              },
                            );
                          }),
                    ))
            ],
          ),
        ],
      ),
    );
  }
}

class FoodListItem extends StatelessWidget {
  final FoodItem foodItem;
  final Function callback;
  const FoodListItem({Key key, this.foodItem, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageWidth = (MediaQuery.of(context).size.width - 60) / 2.0;
    var buttonWidth = (imageWidth - 10) / 2.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: imageWidth,
          height: imageWidth * 0.72,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              foodItem.imageURL,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Container(
          width: imageWidth,
          height: imageWidth * 0.72,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                foodItem.title,
                style: TextStyles.headerText(18),
              ),
              Row(
                children: <Widget>[
                  Text(
                    foodItem.price.toString(),
                    style: TextStyles.headerText(22),
                  ),
                  Text(
                    " \$ / ${foodItem.unit}",
                    style: TextStyles.secondaryText(18),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 48,
                    width: buttonWidth,
                    decoration: BoxDecoration(
                        color: AppColors.textSecondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.favorite),
                        onPressed: callback),
                  ),
                  Container(
                    height: 48,
                    width: buttonWidth,
                    decoration: BoxDecoration(
                        color: AppColors.buttonPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.shopping_cart),
                        onPressed: callback),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
