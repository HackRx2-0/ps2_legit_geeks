import 'package:store_app/constant/appconstant.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/services/prefs_services.dart';
import 'package:flutter/cupertino.dart';

class LogInViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  // Prefs _prefs = Prefs();
  final _prefs = getIt.get<Prefs>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  void signUp(BuildContext context) async {
    setState(viewState: ViewState.Busy);
    final response = await _apiService.signupMethod({
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'username': userNameController.text,
      'password1': passwordController.text,
      'password2': passwordController.text,
      'referral_code': referralCodeController.text,
    });
    if (!response.error) {
      setState(viewState: ViewState.Idle);

      _prefs.setAuthToken(response.data['key']);
      _prefs.setUID(response.data['user'].toString());

      print('success');
      navigationService.navigateTo('/Tabs',
          arguments: 2, withreplacement: true);
    } else {
      setState(viewState: ViewState.Idle);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }

  void logIn(BuildContext context) async {
    setState(viewState: ViewState.Busy);
    final response = await _apiService.loginMethod({
      'username': userNameController.text,
      'password': passwordController.text
    });
    if (!response.error) {
      setState(viewState: ViewState.Idle);
      print(response.data);
      _prefs.setAuthToken(response.data['key']);
      _prefs.setUID(response.data['user'].toString());
      print('success');
      navigationService.navigateTo('/Tabs',
          arguments: 2, withreplacement: true);
    } else {
      setState(viewState: ViewState.Idle);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }
}
