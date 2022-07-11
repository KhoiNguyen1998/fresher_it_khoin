import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trainng_day1/model/author.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Call api with Dio';
  Dio dio = Dio();
  var listUsers;

  Future<List<User>?> fetchUser() async {
    try {
      Response res = await dio.get('https://agrichapp.herokuapp.com/members');
      if (res.statusCode == 200) {
        var getUserDate = res.data as List;
        var listUsers = getUserDate.map((e) => User.fromJson(e)).toList();
        return listUsers;
      } else {
        throw Exception(res.data);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    listUsers = fetchUser();
  }

  @override
  void dispose() {
    super.dispose();
    listUsers = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: FutureBuilder<List<User>?>(
        future: listUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) {
                var user = (snapshot.data as List<User>)[index];
                return Container(
                  child: Column(
                    children: [
                      Text(user.name),
                      Text(user.address),
                      Text(user.bio),
                      Text(user.company),
                      Text(user.image),
                      Text(user.position),
                      Text(user.isPremium.toString()),
                      Text('${user.age}'),
                      Text(user.job),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: (snapshot.data as List<User>).length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.hasError}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.amberAccent,
            ),
          );
        },
      ),
    );
  }
}
