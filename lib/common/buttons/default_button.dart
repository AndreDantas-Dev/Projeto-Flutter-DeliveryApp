import 'package:delivery_app/common/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

enum DefaultButtonType { primary, secondary }

class DefaultButton extends StatelessWidget {
  final Function callback;
  final String text;
  final IconData icon;
  final DefaultButtonType type;
  final double width;
  final double height;

  const DefaultButton(
      {@required this.type,
      this.callback,
      this.text = "",
      this.icon,
      this.width = double.infinity,
      this.height = 56});

  @override
  Widget build(BuildContext context) {
    Color color;
    TextStyle style;
    switch (type) {
      case DefaultButtonType.primary:
        color = AppColors.buttonPrimaryColor;
        style = TextStyles.primaryButtonText;
        break;
      default:
        color = AppColors.buttonSecondaryColor;
        style = TextStyles.secondaryButtonText;
    }
    return Container(
      height: height,
      width: width,
      child: CupertinoButton(
          color: color,
          onPressed: () {
            if (callback != null) callback();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon != null ? Icon(icon) : SizedBox.shrink(),
              icon != null && (text?.isNotEmpty ?? false)
                  ? SizedBox(
                      width: 8,
                    )
                  : SizedBox.shrink(),
              text != null
                  ? Text(
                      text,
                      style: style,
                    )
                  : SizedBox.shrink(),
            ],
          )),
    );
  }
}
