import 'package:store_app/config/ui_icons.dart';

import '../models/product.dart';
import '../models/route_argument.dart';
import 'package:flutter/material.dart';

class RecommendedCarouselItemWidget extends StatelessWidget {
  String heroTag;
  double marginLeft;
  Product product;

  RecommendedCarouselItemWidget({
    Key key,
    this.heroTag,
    this.marginLeft,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/Product',
            arguments: new RouteArgument(
                id: product.id, argumentsList: [product, heroTag]));
      },
      child: Container(
        margin: EdgeInsets.only(left: this.marginLeft, right: 0),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Hero(
              tag: heroTag + product.id,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(product.image),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: 120,
              height: 72,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.15),
                        offset: Offset(0, 3),
                        blurRadius: 10)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.body2,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                  Row(
                    children: <Widget>[
                      // The title of the product
                      Text(
                        '89.00',
                        // product.getPrice(),

                        style: Theme.of(context).textTheme.body2,
                      ),

                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      Text(
                        product.rate.toString(),
                        style: Theme.of(context).textTheme.body2,
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
