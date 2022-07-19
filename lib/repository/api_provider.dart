import 'package:dio/dio.dart';
import 'package:flutter_trainng_day1/data/model/author.dart';

class UserProvider {
  final String url = 'https://agrichapp.herokuapp.com/members';
  Dio dio = Dio();

  Future<List<User>?> fetchPremiumUser() async {
    try {
      final res = await dio.get(url, queryParameters: {'isPremium': true});
      if (res.statusCode == 200) {
        var getUserData = res.data as List;
        var listPremiumUser = getUserData.map((e) => User.fromJson(e)).toList();
        print(listPremiumUser);
        return listPremiumUser;
      } else {
        throw Exception("Failed to load user");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<User>?> fetchNormalUser() async {
    try {
      final res = await dio.get(url, queryParameters: {'isPremium': false});
      if (res.statusCode == 200) {
        var getUserData = res.data as List;
        var listUserNormal = getUserData.map((e) => User.fromJson(e)).toList();
        print(listUserNormal);
        return listUserNormal;
      } else {
        throw Exception("Failed to load user");
      }
    } catch (e) {
      print(e);
    }
  }
}
