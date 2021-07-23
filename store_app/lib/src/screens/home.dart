import 'package:get_it/get_it.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/view/home_viewmodel.dart';

import '../../config/ui_icons.dart';
import '../models/brand.dart';
import '../../provider/getit.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../widgets/BrandsIconsCarouselWidget.dart';
import '../widgets/CategoriesIconsCarouselWidget.dart';
import '../widgets/CategorizedProductsWidget.dart';
import '../widgets/FlashSalesCarouselWidget.dart';
import '../widgets/FlashSalesWidget.dart';
import '../widgets/HomeSliderWidget.dart';
import '../widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  // List<Product> _productsOfCategoryList;
  // List<Product> _productsOfBrandList;
  // CategoriesList _categoriesList = new CategoriesList();
  // BrandsList _brandsList = new BrandsList();
  ProductsList _productsList = new ProductsList();
  // final HomeViewModel viewmodel = getIt<HomeViewModel>();

  Animation animationOpacity;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();

    // _productsOfCategoryList = _categoriesList.list.firstWhere((category) {
    //   return category.selected;
    // }).products;

    // _productsOfBrandList = _brandsList.list.firstWhere((brand) {
    //   return brand.selected;
    // }).products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) => model.fetchInitData(),
      builder: (ctx, model, child) => ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBarWidget(),
          ),
          HomeSliderWidget(),
          FlashSalesHeaderWidget(),
          FlashSalesCarouselWidget(
              heroTag: 'home_flash_sales',
              productsList: _productsList.flashSalesList),
          // Heading (Recommended for you)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              leading: Icon(
                UiIcons.favorites,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                'Recommended For You',
                style: Theme.of(context).textTheme.display1,
              ),
              trailing: TextButton(onPressed: () {}, child: Text('See more')),
            ),
          ),
          model.categories.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StickyHeader(
                  header: CategoriesIconsCarouselWidget(
                      heroTag: 'home_categories_1',
                      categoriesList: model.categoriesList,
                      onChanged: (id) {
                        setState(() {
                          animationController.reverse().then((f) {
                            model.productsOfCategoryList = model
                                .categoriesList.list
                                .firstWhere((category) {
                              return category.id == id;
                            }).products;
                            animationController.forward();
                          });
                        });
                      }),
                  content: CategorizedProductsWidget(
                      animationOpacity: animationOpacity,
                      productsList: model.productsOfCategoryList),
                ),

          // Heading (Brands)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              leading: Icon(
                UiIcons.flag,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                'Brands',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ),
          model.brands.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StickyHeader(
                  header: BrandsIconsCarouselWidget(
                      heroTag: 'home_brand_1',
                      brandsList: model.brandsList,
                      onChanged: (id) {
                        setState(() {
                          animationController.reverse().then((f) {
                            model.productsOfBrandsList =
                                model.brandsList.list.firstWhere((brand) {
                              return brand.id == id;
                            }).products;
                            animationController.forward();
                          });
                        });
                      }),
                  content: CategorizedProductsWidget(
                      animationOpacity: animationOpacity,
                      productsList: model.productsOfBrandsList),
                ),
        ],
      ),
    );
//      ],
//    );
  }
}
