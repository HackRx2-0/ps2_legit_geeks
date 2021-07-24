import 'package:store_app/constant/appconstant.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/address.dart';
import 'package:flutter/material.dart';

class AddressViewModel extends BaseModel {
  List<Address> initData = [];
  List<Address> checkedWebsite = [];

  TextEditingController fullNameController = TextEditingController();
  TextEditingController streetAddress1Controller = TextEditingController();
  TextEditingController streetAddress2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  ApiService _apiService = ApiService();

  void addAddress(BuildContext context) async {
    Address address = Address();
    address.fullName = fullNameController.text;
    address.streetAddress1 = streetAddress1Controller.text;
    address.streetAddress2 = streetAddress2Controller.text;
    address.city = cityController.text;
    address.state = stateController.text;
    address.postalCode = postalCodeController.text;
    address.phone = phoneController.text;
    var data = address.toJson();
    print(data);

    setState(viewState: ViewState.Busy);
    final response = await _apiService.postAddressMethod(
        endpoint: '/webtraffic/websites/', data: data);
    if (!response.error) {
      setState(viewState: ViewState.Idle);
      print('success');
      navigationService.navigateTo('/Tabs',
          arguments: 1, withreplacement: true);
    } else {
      setState(viewState: ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }

  void editAddress(BuildContext context, String id) async {
    Address address = Address();
    address.fullName = fullNameController.text;
    address.streetAddress1 = streetAddress1Controller.text;
    address.streetAddress2 = streetAddress2Controller.text;
    address.city = cityController.text;
    address.state = stateController.text;
    address.postalCode = postalCodeController.text;
    address.phone = phoneController.text;
    var data = address.toJson();
    print(data);

    setState(viewState: ViewState.Busy);
    final response = await _apiService.patchAddressMethod(
        endpoint: '/accounts/websites/$id/', data: data);
    if (!response.error) {
      setState(viewState: ViewState.Idle);
      print('success');
      navigationService.navigateTo('/Tabs',
          arguments: 1, withreplacement: true);
    } else {
      setState(viewState: ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }

  void getAddresses(BuildContext context) async {
    setState(viewState: ViewState.Busy);
    final response =
        await _apiService.getAddressMethod(endpoint: '/accounts/address/');
    if (!response.error) {
      setState(viewState: ViewState.Idle);
      print(response.data);
      initData = addressFromJson(response.data);
    } else {
      setState(viewState: ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }

  void deleteWebsite(BuildContext context, String id) async {
    print(id);
    setState(viewState: ViewState.Busy);
    final response = await _apiService.deleteAddressMethod(
        endpoint: '/webtraffic/websites', id: id);
    if (!response.error) {
      print('====================================');
      setState(viewState: ViewState.Idle);
      print(response.data);
    } else {
      setState(viewState: ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
      navigationService.navigateTo('/Tabs',
          arguments: 1, withreplacement: true);
    }
  }

  void getOneAddress(BuildContext context, String id) async {
    print(id);
    if (id == null) return;
    setState(viewState: ViewState.Busy);
    final response =
        await _apiService.getRequest(endpoint: '/webtraffic/websites/$id');
    if (!response.error) {
      print('====================================');
      setState(viewState: ViewState.Idle);
      print(response.data);
      final address = Address.fromJson(response.data);

      fullNameController.text = address.fullName;
      streetAddress1Controller.text = address.streetAddress1;
      streetAddress2Controller.text = address.streetAddress2;
      cityController.text = address.city;
      stateController.text = address.state;
      postalCodeController.text = address.postalCode;
      phoneController.text = address.phone;
    } else {
      setState(viewState: ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
      navigationService.navigateTo('/Tabs',
          arguments: 1, withreplacement: true);
    }
  }
}
