import 'package:flutter_trainng_day1/data/model/author.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = UserProvider();
  Future<List<User>?> fetchListPremiumUser() {
    return _provider.fetchPremiumUser();
  }

  Future<List<User>?> fetchListNormalUser() {
    return _provider.fetchNormalUser();
  }
}

class NewWorkErr extends Error {}
