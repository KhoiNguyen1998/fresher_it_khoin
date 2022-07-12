import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_trainng_day1/const/const.dart';
import 'package:flutter_trainng_day1/dio_call/model/author.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Dio dio = Dio();
  // var listUsers;

  // Future<List<User>?> fetchUser() async {
  //   try {
  //     Response res = await dio.get('https://agrichapp.herokuapp.com/members');
  //     if (res.statusCode == 200) {
  //       var getUserDate = res.data as List;
  //       var listUsers = getUserDate.map((e) => User.fromJson(e)).toList();
  //       return listUsers;
  //     } else {
  //       throw Exception(res.data);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   listUsers = fetchUser();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   listUsers = fetchUser()
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 11, horizontal: 10),
                color: headerColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(svg_back),
                    ),
                    SvgPicture.asset(svg_logo),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(svg_setting),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0),
                color: searchBoxColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(svg_search),
                    ),
                    Text(
                      sortByConditions,
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SvgPicture.asset(svg_clock),
                    Text(showRecentlyLoggedUsers),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: backgroundButtombarColor,
            unselectedItemColor: colorBottomIcon,
            unselectedLabelStyle: TextStyle(color: textBottombarColor),
            selectedLabelStyle: TextStyle(color: textBottombarColor),
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_home),
                label: home,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_account),
                label: myPage,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_speaker),
                label: userAnnouncement,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_event),
                label: eventCommunity,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_members),
                label: listMember,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_message),
                label: message,
              ),
            ],
          ),

          // FutureBuilder<List<User>?>(
          //   future: listUsers,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return ListView.separated(
          //         itemBuilder: (context, index) {
          //           var user = (snapshot.data as List<User>)[index];
          //           return Container(
          //             child: Column(
          //               children: [
          //                 Text(user.name),
          //                 Text(user.address),
          //                 Text(user.bio),
          //                 Text(user.company),
          //                 Text(user.image),
          //                 Text(user.position),
          //                 Text(user.isPremium.toString()),
          //                 Text('${user.age}'),
          //                 Text(user.job),
          //               ],
          //             ),
          //           );
          //         },
          //         separatorBuilder: (context, index) {
          //           return Divider();
          //         },
          //         itemCount: (snapshot.data as List<User>).length,
          //       );
          //     } else if (snapshot.hasError) {
          //       return Center(
          //         child: Text('${snapshot.hasError}'),
          //       );
          //     }
          //     return Center(
          //       child: CircularProgressIndicator(
          //         backgroundColor: Colors.amberAccent,
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
