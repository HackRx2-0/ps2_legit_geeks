import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/models/productDetails.dart';

class ProductDetailsViewmodel extends BaseModel {
  ApiService _apiService = ApiService();
  Product product;
  void initData(String id) async {
    setState(viewState: ViewState.Busy);
    final respone = await _apiService.fetchProdyuct(id: id);
    print(respone.data);
    product = Product.fromJsonDetail(respone.data);

    setState(viewState: ViewState.Idle);
  }
}
