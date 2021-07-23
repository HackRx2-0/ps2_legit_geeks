import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store_app/config/app_config.dart' as cfg;
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/widgets/RecommendedCarouselItemWidget.dart';

class PopupProductsWidget extends StatefulWidget {
  @override
  _PopupProductsWidgetState createState() => _PopupProductsWidgetState();
}

class _PopupProductsWidgetState extends State<PopupProductsWidget> {
  final config = cfg.Colors();
  bool _initial = true;
  bool _close = true;
  double _height = 200;
  double _width;
  double orignalwidth;

  BorderRadiusGeometry _borderRadius = BorderRadius.only(
    // topRight: Radius.circular(50),
    bottomRight: Radius.circular(15),
    topLeft: Radius.circular(15),
    bottomLeft: Radius.circular(15),
  );
  ProductsList _productsList = new ProductsList();
  Widget _switcherWidget;

  @override
  void didChangeDependencies() {
    if (_initial) {
      _width = MediaQuery.of(context).size.width;
      _switcherWidget = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Center(
              child: Text(
                "You might like these!",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: _productsList.flashSalesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  Product product =
                      _productsList.flashSalesList.elementAt(index);
                  return RecommendedCarouselItemWidget(
                    product: product,
                    heroTag: 'flash_sales',
                    marginLeft: 0.0,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10.0,
                  );
                },
              ),
            ),
          ),
        ],
      );
      orignalwidth = _width;
    }
    _initial = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("bool value of close: " + _close.toString());
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        AnimatedContainer(
          // transform: Transform.rotate(angle: -pi / 4).transform,
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          alignment: FractionalOffset.center,
          height: _height,
          width: _width,
          padding: EdgeInsets.symmetric(horizontal: 10),

          // margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: config.secondColor(0.7),
            borderRadius: _borderRadius,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 20.0,
                  spreadRadius: -6.0,
                  color: Colors.black)
            ],
          ),
          // width: MediaQuery.of(context).size.width * 0.9,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _switcherWidget,
            reverseDuration: Duration(milliseconds: 10),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
          ),
        ),
        Positioned(
          top: -15,
          right: -20,
          child: GestureDetector(
            onTap: () {
              if (_close) {
                setState(() {
                  _width = 30;
                  _height = 30;
                  _borderRadius = BorderRadius.only(
                    // topRight: Radius.circular(50),
                    bottomRight: Radius.circular(100),
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  );
                  _switcherWidget = Container();
                });

                _close = false;
              } else {
                _close = true;

                setState(() {
                  print(orignalwidth);
                  _width = orignalwidth;
                  _height = 200;
                  _borderRadius = BorderRadius.only(
                    // topRight: Radius.circular(50),
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  );
                  Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
                    _switcherWidget = Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: Center(
                            child: Text(
                              "You might like these!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: _productsList.flashSalesList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                Product product = _productsList.flashSalesList
                                    .elementAt(index);
                                return RecommendedCarouselItemWidget(
                                  product: product,
                                  heroTag: 'flash_sales',
                                  marginLeft: 0.0,
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 10.0,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                    setState(() {});
                  });
                });
              }
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 7, color: Colors.transparent),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 20.0,
                      spreadRadius: -6.0,
                      color: Colors.black)
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'img/ic_launcher.png',
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
