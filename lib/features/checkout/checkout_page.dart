import 'package:delivery_app/common/app_colors.dart';
import 'package:delivery_app/common/styles.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _selectedOption = 0;
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          height: 48,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          width: double.infinity,
          child: FlatButton(
              onPressed: () {},
              color: AppColors.buttonPrimaryColor,
              child: Text(
                "CONFIRM PAYMENT",
                style: TextStyles.primaryButtonText,
              )),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textPrimaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          "Checkout",
          style: TextStyles.primaryText(20),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(16),
        color: AppColors.defaultBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Payment method",
                    style: TextStyles.headerText(20),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        "CHANGE",
                        style: TextStyles.headerAccentText(14),
                      ))
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.credit_card),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "**** **** **** 4747",
                    style: TextStyles.secondaryText(18),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Delivery Address",
                    style: TextStyles.headerText(20),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        "CHANGE",
                        style: TextStyles.headerAccentText(14),
                      ))
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.home),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Alexandra Smith\nCesu 31 k-2 5.st, SIA Chili\nRiga\nLV-1012\nLatvia",
                        style: TextStyles.secondaryText(18),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Delivery Options",
                    style: TextStyles.headerText(20),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedOption = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.directions_walk,
                            color: _selectedOption == 0
                                ? AppColors.splashBackgroundColor
                                : AppColors.textPrimaryColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "I'll pick it up myself",
                            style: _selectedOption == 0
                                ? TextStyles.primaryAccentText(20)
                                : TextStyles.secondaryText(20),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          _selectedOption == 0
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.splashBackgroundColor,
                                )
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedOption = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.directions_bike,
                            color: _selectedOption == 1
                                ? AppColors.splashBackgroundColor
                                : AppColors.textPrimaryColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "By Courier",
                            style: _selectedOption == 1
                                ? TextStyles.primaryAccentText(20)
                                : TextStyles.secondaryText(20),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          _selectedOption == 1
                              ? Icon(Icons.check,
                                  color: AppColors.splashBackgroundColor)
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedOption = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.local_airport,
                            color: _selectedOption == 2
                                ? AppColors.splashBackgroundColor
                                : AppColors.textPrimaryColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "By Plane",
                            style: _selectedOption == 2
                                ? TextStyles.primaryAccentText(20)
                                : TextStyles.secondaryText(20),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          _selectedOption == 2
                              ? Icon(Icons.check,
                                  color: AppColors.splashBackgroundColor)
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Non-contact-delivery",
                    style: TextStyles.headerText(20),
                  ),
                  Checkbox(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
