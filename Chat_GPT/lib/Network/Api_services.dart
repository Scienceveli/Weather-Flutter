import 'dart:convert';
import 'package:chat_gtp/Data/Data%20Provider/InAppError_Massage.dart';
import 'package:chat_gtp/Data/Error%20Massage/App_Exceptions.dart';
import 'package:chat_gtp/Data/Utilites/AppConstant.dart';
import 'package:chat_gtp/Models/Chat_model.dart.dart';
import 'package:chat_gtp/Models/Model.dart.dart';
import 'package:chat_gtp/network/Network_client.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Future<List<Chat>> submitGetChatsForm({
  required BuildContext context,
  required String prompt,
  required int tokenValue,
  String? model,
}) async {
  //
  NetworkClient networkClient = NetworkClient();
  List<Chat> chatList = [];
  try {
    final res = await networkClient.post(
      "${BASE_URL}completions",
      {
        "model": model ?? "text-davinci-003",
        "prompt": prompt,
        "temperature": 0,
        "max_tokens": tokenValue
      },
      token: OPEN_API_KEY,
    );
    Map<String, dynamic> mp = jsonDecode(res.toString());
    debugPrint(mp.toString());
    if (mp['choices'].length > 0) {
      chatList = List.generate(mp['choices'].length, (i) {
        return Chat.fromJson(<String, dynamic>{
          'msg': mp['choices'][i]['text'],
          'chat': 1,
        });
      });
      debugPrint(chatList.toString());
    }
  } on NetworkException catch (e) {
    Logger().e(e.dioError);
    errorMessage(context);
  }
  return chatList;
}

Future<List<Model>> submitGetModelsForm({
  required BuildContext context,
}) async {
  //
  NetworkClient networkClient = NetworkClient();
  List<Model> modelsList = [];
  try {
    final res = await networkClient.get(
      "${BASE_URL}models",
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
