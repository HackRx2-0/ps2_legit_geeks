import 'package:flutter/material.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/nearbyPeople.dart';

class NearbyViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  List<NearbyPeople> nearbyPeopleList = [];

  void getNearbyPeople(BuildContext context) async {
    if (nearbyPeopleList.isEmpty) {
      setState(viewState: ViewState.Busy);

      final response = await _apiService.getNearbyPeople();

      if (!response.error) {
        setState(viewState: ViewState.Idle);
        print(response.data);
        nearbyPeopleList = [];
        for (var res in response.data) {
          NearbyPeople model = NearbyPeople.fromJson(res);
          nearbyPeopleList.add(model);
        }
      } else {
        print('error in nearby people view model: ' + response.errorMessage);
      }
    }
  }
}
