import 'package:delivery_app/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
            height: 48,
            child: CupertinoTextField(
              prefix: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.search,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              placeholder: "Search",
              placeholderStyle: TextStyles.secondaryText(16),
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(color: AppColors.defaultBorderColor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
            ),
          )
        ],
      ),
    );
  }
}
