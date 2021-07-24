import 'package:http/http.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/services/prefs_services.dart';
import 'package:store_app/view/address_viewmodel.dart';
import 'package:store_app/view/brands_viewmodel.dart';
import 'package:store_app/view/categories_viewmodel.dart';
import 'package:store_app/view/chatbot_viewmodel.dart';
import 'package:store_app/view/chatviewmodel.dart';
import 'package:store_app/view/groupChatViewModel.dart';
import 'package:store_app/view/group_info_viewmodel.dart';
import 'package:store_app/view/group_wishlist_viewmodel.dart';
import 'package:store_app/view/home_viewmodel.dart';
import 'package:store_app/view/login_viewmodel.dart';
import 'package:store_app/view/productdetailsviewmodel.dart';
import 'package:store_app/view/nearbyViewModel.dart';
import 'package:store_app/view/wishlist_viewmodel.dart';
import 'package:store_app/view/produts_viewmodel.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerSingleton<Prefs>(Prefs());
  getIt.registerSingleton<ChatViewModel>(ChatViewModel());
  getIt.registerSingleton<HomeViewModel>(HomeViewModel());
  getIt.registerSingleton<WishListViewModel>(WishListViewModel());
  getIt.registerFactory(() => ApiService());
  getIt.registerFactory(() => LogInViewModel());
  getIt.registerFactory(() => CategoriesViewModel());
  getIt.registerFactory(() => BrandsViewModel());
  getIt.registerFactory(() => GroupWishlistViewmodel());
  getIt.registerFactory(() => ChatBotViewmodel());
  getIt.registerFactory(() => GroupChatViewModel());
  getIt.registerFactory(() => GroupInfoViewModel());
  getIt.registerFactory(() => ProductDetailsViewmodel());
  getIt.registerFactory(() => NearbyViewModel());

  // getIt.registerFactory(() => AddressViewModel());

  getIt.registerFactory(() => ProdutsViewModel());

  // getIt.registerFactory(() => WebsiteViewModel());
}
