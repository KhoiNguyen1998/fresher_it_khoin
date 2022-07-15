import 'package:flutter_trainng_day1/data/model/author.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = UserProvider();
  Future<List<User>?> fetchUserList() {
    return _provider.fetchUser();
  }
}

class NewWorkErr extends Error {}
