import 'package:dio/dio.dart';
import 'package:flutter_trainng_day1/data/model/author.dart';

class UserRepo {
  final String url = 'https://agrichapp.herokuapp.com/members';
  Dio dio = Dio();

  Stream<List<User>?> fetchUser() async* {
    try {
      Response res = await dio.get(url);
      if (res.statusCode == 200) {
        var getUserData = res.data as List;
        var listUsers = getUserData.map((e) => User.fromJson(e)).toList();
        yield listUsers;
      } else {
        throw Exception(res.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
