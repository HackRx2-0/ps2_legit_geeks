import 'package:flutter/material.dart';
import 'package:store_app/constant/appconstant.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/product.dart';

class ProdutsViewModel extends BaseModel {
  List<Product> initData = [];

  ApiService _apiService = ApiService();
  void getWishlist(BuildContext context) async {
    setState(viewState: ViewState.Busy);
    final response = await _apiService.getProducts();
    if (!response.error) {
      setState(viewState: ViewState.Idle);
      print(response.data);
      //  final prod = productToJson(res);
      for (var res in response.data) {
        initData.add(res);
        // print(checkedWebsite);
      }
      // } else {
      // setState(ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }
}
