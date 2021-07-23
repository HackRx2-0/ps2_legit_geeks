import 'package:flutter/material.dart';
import 'package:store_app/config/ui_icons.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/widgets/GroupCartItemWidget.dart';

import 'CartItemWidget.dart';

class CartPageUI extends StatefulWidget {
  final ProductsList _productsList;

  CartPageUI(this._productsList);

  @override
  _CartPageUIState createState() => _CartPageUIState();
}

class _CartPageUIState extends State<CartPageUI> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 150),
          padding: EdgeInsets.only(bottom: 15),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    leading: Icon(
                      UiIcons.shopping_cart,
                      color: Theme.of(context).hintColor,
                    ),
                    title: Text(
                      'Shopping Cart',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.display1,
                    ),
                    subtitle: Text(
                      'Verify your quantity and click checkout',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
                ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: widget._productsList.cartList.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 15);
                  },
                  itemBuilder: (context, index) {
                    return GroupCartItemWidget(
                        product: widget._productsList.cartList.elementAt(index),
                        heroTag: 'cart');
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 170,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).focusColor.withOpacity(0.15),
                      offset: Offset(0, -2),
                      blurRadius: 5.0)
                ]),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Subtotal',
                          style: Theme.of(context).textTheme.body2,
                        ),
                      ),
                      Text('\₹50.23',
                          style: Theme.of(context).textTheme.subhead),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'TAX (20%)',
                          style: Theme.of(context).textTheme.body2,
                        ),
                      ),
                      Text('\₹13.23',
                          style: Theme.of(context).textTheme.subhead),
                    ],
                  ),
                  SizedBox(height: 10),
                  Stack(
                    fit: StackFit.loose,
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/Checkout');
                          },
                          padding: EdgeInsets.symmetric(vertical: 14),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                          child: Text(
                            'Checkout',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '\₹55.36',
                          style: Theme.of(context).textTheme.display1.merge(
                              TextStyle(color: Theme.of(context).primaryColor)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
