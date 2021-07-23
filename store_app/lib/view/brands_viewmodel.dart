import 'package:store_app/provider/base_model.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/brand.dart';
import 'package:store_app/src/models/category.dart';
import 'package:store_app/view/home_viewmodel.dart';

class BrandsViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  Brand selectedBrand;
  List<Brand> _brandList = [];
  BrandsList brandsList = BrandsList();
  void initData() async {
    _brandList = await getIt.get<HomeViewModel>().fetchBrands();
    brandsList.list = _brandList;
    setState();
  }

  void productsByBrand(String id) async {
    print(id);
    final response = await _apiService.fetchBrandById(id);
    selectedBrand = Brand.fromJson(response.data);
    setState();
  }
}
