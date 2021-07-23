import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  final String _userIDStorageKey = 'USER_ID';
  final String _authTokenStorageKey = 'AUTH_TOKEN';

  String _authToken;
  getToken() => _authToken;
  Future<String> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_authTokenStorageKey) ?? '';
  }

  Future<void> setAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _authToken = token;
    print(token);
    prefs.setString(_authTokenStorageKey, token);
  }

  Future<void> setUID(String uID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //print('called: $_userID');
    prefs.setString(_userIDStorageKey, uID);
  }
}
