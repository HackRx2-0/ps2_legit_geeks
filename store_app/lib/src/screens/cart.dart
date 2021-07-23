import 'package:store_app/src/widgets/GroupPageWidget.dart';

import '../../config/ui_icons.dart';
import '../models/product.dart';
import '../widgets/CartItemWidget.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  ProductsList _productsList;
  @override
  void initState() {
    _productsList = new ProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon:
              new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.display1,
        ),
        actions: <Widget>[
          Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
              child: InkWell(
                borderRadius: BorderRadius.circular(300),
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: AssetImage('img/user2.jpg'),
                ),
              )),
        ],
      ),
      body: CartPageUI(_productsList),
    );
  }
}
