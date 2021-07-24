import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/services/api_urls.dart';
import 'package:store_app/services/prefs_services.dart';
// import 'package:store_app/src/models/conversation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:dialogflow_grpc/v2beta1.dart';
// import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';
import 'package:dialogflow_grpc/dialogflow_auth.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';

class ChatViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  final myController = TextEditingController();
  var initialData;
  final _prefs = getIt.get<Prefs>();
  WebSocketChannel socket;
  WebSocketChannel recommendationSocket;
  DialogflowGrpcV2Beta1 dialogflow;

  void initData() async {
    setState(viewState: ViewState.Busy);
    print('object ka nam');
    final data = await _apiService.fetchChats(id: '10');
    initialData = data.data;
    try {
      print(state);
      socket = IOWebSocketChannel.connect(
        Uri.parse(chatsocketurl),
        headers: {
          HttpHeaders.authorizationHeader: 'Token ${_prefs.getToken()}'
        },
      );
      recommendationSocket = IOWebSocketChannel.connect(
        Uri.parse(recommendationsocketurl),
        headers: {
          HttpHeaders.authorizationHeader: 'Token ${_prefs.getToken()}'
        },
      );
      final serviceAccount = ServiceAccount.fromString(
          '${(await rootBundle.loadString('img/credentials.json'))}');

      dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);

      setState(viewState: ViewState.Idle);
      print(state);
    } on SocketException catch (e) {
      print('error: ' + e.toString());
    }
    if (socket == null) {
      print('socket hi khrab hai');
    }
  }
}
