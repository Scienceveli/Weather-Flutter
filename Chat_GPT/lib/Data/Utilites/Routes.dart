import 'package:chat_gtp/Data/Error%20Massage/App_Exceptions.dart';
import 'package:chat_gtp/View/Screen/Chat/chat_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String chat = 'chat';
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatScreen());

      default:
        throw RouteException('Route not found');
    }
  }
}
