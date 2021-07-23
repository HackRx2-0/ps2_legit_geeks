import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  final String _userIDStorageKey = 'USER_ID';
  final String _authTokenStorageKey = 'AUTH_TOKEN';
  final String _languageStorageKey = 'LANGUAGE';
  final String _voiceNotificationStorageKey = 'VOICE_NOTIF';

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

  Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageStorageKey) ?? 'English';
  }

  Future<void> setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_languageStorageKey, language);
  }

  Future<bool> getVoiceNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_voiceNotificationStorageKey) ?? true;
  }

  Future<void> setVoiceNotification(bool selected) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_voiceNotificationStorageKey, selected);
  }
}
