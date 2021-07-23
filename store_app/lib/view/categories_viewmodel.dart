import 'package:store_app/provider/base_model.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/category.dart';
import 'package:store_app/view/home_viewmodel.dart';

class CategoriesViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  Category selectedCategory;
  List<Category> categorylist = [];
  void initData() async {
    categorylist = await getIt.get<HomeViewModel>().fetchCategories();
    setState();
  }

  void productsByCategory(String id) async {
    final response = await _apiService.fetchCategoryById(id);
    selectedCategory = Category.fromJson(response.data);
    setState();
  }
}
