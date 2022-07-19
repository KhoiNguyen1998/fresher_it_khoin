import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_trainng_day1/bloc/user_bloc.dart';
import 'package:flutter_trainng_day1/const/const.dart';
import 'package:flutter_trainng_day1/data/model/author.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          context.read<UserBloc>().add(UserNormalFetcherEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserNormalLoaded) {
          return buildTabbarView(listUser: state.normalUser);
        } else if (state is UserErrorState) {
          return Center(
            child: Text('Error!!'),
          );
        }
        return Text('Error');
      },
    );
    // return BlocProvider(
    //   create: (context) => UserBloc(),
    //   child: SafeArea(
    //     child: Scaffold(
    //       body: BlocBuilder<UserBloc, UserState>(
    //         builder: (context, state) {
    //           if (state is UserLoadingState)
    //             return Center();
    //           else if (state is UserErrorState)
    //             return Center(
    //               child: Text("Something went wrong"),
    //             );
    //           else if (state is UserNormalLoaded)
    //             return buildTabbarView(listUser: state.normalUser);
    //           else
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget buildTabbar() {
    return Column(
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
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        DefaultTabController(
          length: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TabBar(
                  onTap: (value) {},
                  controller: _tabController,
                  unselectedLabelColor: unSelectLabelColor,
                  labelColor: selectedLabelColor,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(svg_clock),
                            SizedBox(
                              width: 4,
                            ),
                            AutoSizeText(
                              showRecentlyLoggedUsers,
                              style: TextStyle(fontSize: 10.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          SvgPicture.asset(svg_monorchy),
                          SizedBox(
                            width: 4,
                          ),
                          AutoSizeText(
                            showUsersRank,
                            style: TextStyle(fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
              ),
              Container(
                height: 400,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                        // child: buildTabbarView(listUser: listNormalUser),
                        ),
                    Container(
                        // child: buildTabbarView(listUser: listPremiumUser),
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildCard(BuildContext context, List<User>? user) {
  //   return ListView.builder(
  //     itemCount: user!.length,
  //     itemBuilder: (context, index) {
  //       return Container(
  //         margin: EdgeInsets.all(8.0),
  //         child: Card(
  //           child: Container(
  //             margin: EdgeInsets.all(8.0),
  //             child: Column(
  //               children: [
  //                 Text(context.watch<UserBloc>().toString()),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _buildLoading() {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }
}

class buildTabbarView extends StatelessWidget {
  buildTabbarView({
    Key? key,
    required this.listUser,
  }) : super(key: key);

  List<User>? listUser;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        childAspectRatio: 1.6,
        mainAxisSpacing: 16,
      ),
      itemCount: listUser!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            // Text(listUser![index].bio),
            // Text(),
            // Text(),
            // Text(),
            // Text(),
            // Text(),
            // Text(),
          ],
        );
      },
    );
  }
}
