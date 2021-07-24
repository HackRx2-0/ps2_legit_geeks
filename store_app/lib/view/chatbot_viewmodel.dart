import 'package:flutter/services.dart';
import 'package:store_app/provider/base_model.dart';

import 'package:dialogflow_grpc/dialogflow_auth.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';

class ChatBotViewmodel extends BaseModel {
  DialogflowGrpcV2Beta1 dialogflow;
  void initData() async {
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('img/credentials.json'))}');

    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }
}
