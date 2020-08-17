import 'package:delivery_app/common/app_colors.dart';
import 'package:delivery_app/common/styles.dart';
import 'package:flutter/material.dart';

class DefaultNavigation extends StatelessWidget {
  final String text;
  const DefaultNavigation({this.text = ""});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.textPrimaryColor,
              ),
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 16),
              child: Text(
                text,
                style: TextStyles.headerText(36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
