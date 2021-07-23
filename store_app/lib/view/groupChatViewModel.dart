import 'package:flutter/material.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/groupConversation.dart';

class GroupChatViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  List<GroupConversation> groupConversations = [];

  void getGroupChat(BuildContext context) async {
    if (groupConversations.isEmpty) {
      setState(viewState: ViewState.Busy);

      final response = await _apiService.getGroupChat();

      if (!response.error) {
        setState(viewState: ViewState.Idle);
        print(response.data);
        groupConversations = [];
        for (var res in response.data) {
          GroupConversation model = GroupConversation.fromJson(res);
          groupConversations.add(model);
        }
      } else {
        print('error in group chat view model: ' + response.errorMessage);
      }
    }
  }
}
