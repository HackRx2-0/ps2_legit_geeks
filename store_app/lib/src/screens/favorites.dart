import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/view/wishlist_viewmodel.dart';

import '../../config/ui_icons.dart';
import '../models/product.dart';
import '../widgets/EmptyFavoritesWidget.dart';
import '../widgets/FavoriteListItemWidget.dart';
import '../widgets/ProductGridItemWidget.dart';
import '../widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoritesWidget extends StatefulWidget {
  @override
  _FavoritesWidgetState createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  String layout = 'list';
  ProductsList _productsList = new ProductsList();

  @override
  Widget build(BuildContext context) {
    return BaseView<WishListViewModel>(
      onModelReady: (model) => model.getWishlist(context),
      builder: (ctx, model, child) => model.state == ViewState.Busy
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SearchBarWidget(),
                  ),
                  SizedBox(height: 10),
                  Offstage(
                    offstage: model.wishList.isEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        leading: Icon(
                          UiIcons.heart,
                          color: Theme.of(context).hintColor,
                        ),
                        title: Text(
                          'Wish List',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: Theme.of(context).textTheme.display1,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  this.layout = 'list';
                                });
                              },
                              icon: Icon(
                                Icons.format_list_bulleted,
                                color: this.layout == 'list'
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context).focusColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  this.layout = 'grid';
                                });
                              },
                              icon: Icon(
                                Icons.apps,
                                color: this.layout == 'grid'
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context).focusColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: this.layout != 'list' || model.wishList.isEmpty,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: model.wishList.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      itemBuilder: (context, index) {
                        return FavoriteListItemWidget(
                          heroTag: 'favorites_list',
                          product: model.wishList.elementAt(index).product,
                          onDismissed: () {
                            setState(() {
                              _productsList.favoritesList.removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Offstage(
                    offstage: this.layout != 'grid' || model.wishList.isEmpty,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: new StaggeredGridView.countBuilder(
                        primary: false,
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        itemCount: model.wishList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product =
                              model.wishList.elementAt(index).product;
                          return ProductGridItemWidget(
                            product: product,
                            heroTag: 'favorites_grid',
                          );
                        },
//                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(index % 2 == 0 ? 1 : 2),
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.fit(2),
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: model.wishList.isNotEmpty,
                    child: EmptyFavoritesWidget(),
                  )
                ],
              ),
            ),
    );
  }
}
