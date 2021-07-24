import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';

class GroupInfoViewModel extends BaseModel {
  ApiService _apiService = ApiService();

  void initData() {
    setState(viewState: ViewState.Busy);
  }
}
