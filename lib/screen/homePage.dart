import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_trainng_day1/bloc/user_bloc.dart';
import 'package:flutter_trainng_day1/const/const.dart';
// import 'package:flutter_trainng_day1/dio_call/model/author.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_trainng_day1/data/repository/user_repo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   listUsers = fetchUser()
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => UserBloc(
          RepositoryProvider.of<UserRepo>(context),
        )..add(LoadUserEvent()),
        child: Scaffold(
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserLoadedState) {
                return Center(
                  child: Text(state.user.first.toString()),
                );
              }
              return Container();
              // Column(
              //   children: <Widget>[
              //     Container(
              //       padding: EdgeInsets.symmetric(vertical: 11, horizontal: 10),
              //       color: headerColor,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: <Widget>[
              //           IconButton(
              //             onPressed: () {},
              //             icon: SvgPicture.asset(svg_back),
              //           ),
              //           SvgPicture.asset(svg_logo),
              //           IconButton(
              //             onPressed: () {},
              //             icon: SvgPicture.asset(svg_setting),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       padding: EdgeInsets.only(right: 10.0),
              //       color: searchBoxColor,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: <Widget>[
              //           IconButton(
              //             onPressed: () {},
              //             icon: SvgPicture.asset(svg_search),
              //           ),
              //           Text(
              //             sortByConditions,
              //             style: TextStyle(
              //                 fontSize: 10.0, fontWeight: FontWeight.bold),
              //           ),
              //         ],
              //       ),
              //     ),
              //     DefaultTabController(
              //       length: 2,
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Container(
              //             padding: EdgeInsets.symmetric(horizontal: 8),
              //             child: TabBar(
              //               unselectedLabelColor: unSelectLabelColor,
              //               labelColor: selectedLabelColor,
              //               isScrollable: true,
              //               indicatorColor: Colors.transparent,
              //               labelStyle: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //               ),
              //               tabs: [
              //                 Tab(
              //                   child: Row(
              //                     children: [
              //                       SvgPicture.asset(svg_clock),
              //                       SizedBox(
              //                         width: 4,
              //                       ),
              //                       AutoSizeText(
              //                         showRecentlyLoggedUsers,
              //                         style: TextStyle(fontSize: 10.0),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 Tab(
              //                   child: Row(
              //                     children: [
              //                       SvgPicture.asset(svg_monorchy),
              //                       SizedBox(
              //                         width: 4,
              //                       ),
              //                       AutoSizeText(
              //                         showUsersRank,
              //                         style: TextStyle(fontSize: 10.0),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Divider(
              //             height: 1,
              //           ),
              //           Container(
              //             height: 400,
              //             child: TabBarView(
              //               children: [
              //                 Container(
              //                   child: Center(
              //                     child: Text('This is page 1'),
              //                   ),
              //                 ),
              //                 Container(
              //                   child: Center(
              //                     child: Text('This is page 1'),
              //                   ),
              //                 )
              //               ],
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // );
            },
          ),

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: backgroundButtombarColor,
            unselectedItemColor: colorBottomIcon,
            unselectedLabelStyle: TextStyle(color: textBottombarColor),
            selectedLabelStyle: TextStyle(color: textBottombarColor),
            showUnselectedLabels: true,
            // showSelectedLabels: true,
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
