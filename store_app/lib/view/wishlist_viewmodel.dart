import 'package:flutter/material.dart';
import 'package:store_app/constant/appconstant.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/models/wishList.dart';

class WishListViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  List<WishlistModel> wishList = [];
  void getWishlist(BuildContext context) async {
    if (wishList.isEmpty) {
      setState(viewState: ViewState.Busy);
      final response = await _apiService.getWishlist();
      if (!response.error) {
        setState(viewState: ViewState.Idle);
        print(response.data);
        wishList = [];
        for (var res in response.data) {
          WishlistModel model = WishlistModel.fromJson(res);
          wishList.add(model);
        }
      } else {
        print('error in wishlist view model: ' + response.errorMessage);
      }
    }
  }
}
