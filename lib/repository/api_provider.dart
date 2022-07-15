import 'package:dio/dio.dart';
import 'package:flutter_trainng_day1/data/model/author.dart';

class UserProvider {
  final String url = 'https://agrichapp.herokuapp.com/members';
  Dio dio = Dio();

  Future<List<User>?> fetchUser() async {
    try {
      final res = await dio.get(url);
      var userData = User.fromJson(res.data) as List<User>;
      return userData;
    } catch (e) {
      print(e);
    }
  }
}
