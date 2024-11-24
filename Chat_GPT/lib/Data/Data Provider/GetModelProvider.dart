import 'dart:convert';

import 'package:chat_gtp/Data/Data%20Provider/InAppError_Massage.dart';
import 'package:chat_gtp/Data/Error%20Massage/App_Exceptions.dart';
import 'package:chat_gtp/Data/Utilites/AppConstant.dart';
import 'package:chat_gtp/Models/Model.dart.dart';
import 'package:chat_gtp/Network/Network_client.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Future<List<Model>> submitGetModelsForm({
  required BuildContext context,
}) async {
  //
  NetworkClient networkClient = NetworkClient();
  List<Model> modelsList = [];
  try {
    final res = await networkClient.get(
      "https://api.openai.com/v1/models",
      token: OPEN_API_KEY,
    );
    Map<String, dynamic> mp = jsonDecode(res.toString());
    debugPrint(mp.toString());
    if (mp['data'].length > 0) {
      modelsList = List.generate(mp['data'].length, (i) {
        return Model.fromJson(<String, dynamic>{
          'id': mp['data'][i]['id'],
          'created': mp['data'][i]['created'],
          'root': mp['data'][i]['root'],
        });
      });
      debugPrint(modelsList.toString());
    }
  } on NetworkException catch (e) {
    Logger().e(e.dioError);
    errorMessage(context);
  }
  return modelsList;
}
