import 'package:store_app/provider/base_view.dart';
import 'package:store_app/view/categories_viewmodel.dart';

import '../../config/ui_icons.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../widgets/FavoriteListItemWidget.dart';
import '../widgets/ProductGridItemWidget.dart';
import '../widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsByCategoryWidget extends StatefulWidget {
  String id;
  int selectedIndex;

  ProductsByCategoryWidget({Key key, this.id, this.selectedIndex})
      : super(key: key);

  @override
  _ProductsByCategoryWidgetState createState() =>
      _ProductsByCategoryWidgetState();
}

class _ProductsByCategoryWidgetState extends State<ProductsByCategoryWidget> {
  String layout = 'grid';
  @override
  Widget build(BuildContext context) {
    return BaseView<CategoriesViewModel>(
      onModelReady: (model) => model.productsByCategory(widget.id),
      builder: (ctx, model, child) {
        return model.selectedCategory == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: SearchBarWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      leading: Icon(
                        UiIcons.box,
                        color: Theme.of(context).hintColor,
                      ),
                      title: Text(
                        '${model.selectedCategory.subCategories[widget.selectedIndex].name} Category',
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
                  Offstage(
                    offstage: this.layout != 'list',
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: model.selectedCategory
                          .subCategories[widget.selectedIndex].products.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      itemBuilder: (context, index) {
                        // TODO replace with products list item
                        return FavoriteListItemWidget(
                          heroTag: 'products_by_category_list',
                          product: model.selectedCategory
                              .subCategories[widget.selectedIndex].products
                              .elementAt(index),
                          onDismissed: () {
                            setState(() {
                              model.selectedCategory
                                  .subCategories[widget.selectedIndex].products
                                  .removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Offstage(
                    offstage: this.layout != 'grid',
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: new StaggeredGridView.countBuilder(
                        primary: false,
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        itemCount: model
                            .selectedCategory
                            .subCategories[widget.selectedIndex]
                            .products
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product = model.selectedCategory
                              .subCategories[widget.selectedIndex].products
                              .elementAt(index);
                          return ProductGridItemWidget(
                            product: product,
                            heroTag: 'products_by_category_grid',
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
                ],
              );
      },
    );
  }
}
