import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:beesupp_frontend_flutter/constants/constants.dart';
import 'package:beesupp_frontend_flutter/models/user.dart';

class UserCommunication {
  static Future<List<User>> getUsers() async {
    List<User> itemlist = [];
    try {
      final response = await http.get(Uri.parse(ConstantLinks.getUsersUrl));

      if (response.statusCode == 200) {
        var v = json.decode(response.body)['items'];
        for (var item in v) {}
        return itemlist;
      } else {
        throw Exception('Failed to load campaigns');
      }
    } catch (ex) {
      return itemlist;
    }
  }
}
