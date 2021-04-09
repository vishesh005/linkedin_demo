import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linkedin_clone/providers/stories.dart';
import 'package:linkedin_clone/widgets/read_more.dart';

class DashboardScreen extends StatefulWidget {
  static final String routeName = "/dashboard";

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _screenPosition = 0;
  List<Widget> _bottomNavChildren = [
    DashboardHomeWidget(),
    Container(),
    Container(),
    Container(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: DashboardDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: false,
                expandedHeight: 60,
                flexibleSpace: FlexibleSpaceBar(
                  background: DashboardAppBar(),
                  centerTitle: true,
                ),
              )
            ];
          },
          body: _bottomNavChildren[_screenPosition]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenPosition,
        type: BottomNavigationBarType.fixed,
        onTap: (position) {
          setState(() {
            _screenPosition = position;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: _screenPosition == 0
                  ? Icon(
                      Icons.home,
                      color: theme.primaryColor,
                    )
                  : Icon(Icons.home_outlined),
              label: "Home"),
          BottomNavigationBarItem(
              icon: _screenPosition == 1
                  ? Icon(
                      Icons.people,
                      color: theme.primaryColor,
                    )
                  : Icon(Icons.people_alt_outlined),
              label: "My Network"),
          BottomNavigationBarItem(
              icon: _screenPosition == 2
                  ? Icon(
                      Icons.add_circle,
                      color: theme.primaryColor,
                    )
                  : Icon(Icons.add_circle_outline),
              label: "Post"),
          BottomNavigationBarItem(
              icon: _screenPosition == 3
                  ? Icon(
                      Icons.notifications,
                      color: theme.primaryColor,
                    )
                  : Icon(Icons.notifications_outlined),
              label: "Notifications"),
          BottomNavigationBarItem(
              icon: _screenPosition == 4
                  ? Icon(
                      Icons.work,
                      color: theme.primaryColor,
                    )
                  : Icon(Icons.work_outline),
              label: "Jobs")
        ],
      ),
    );
  }
}

class DashboardAppBar extends AppBar {
  DashboardAppBar()
      : super(
            automaticallyImplyLeading: false,
            elevation: 1,
            leading: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                          image: AssetImage("resource/images/face.jpeg"),
                          fit: BoxFit.contain)),
                ),
                Positioned(
                  child: Icon(
                    Icons.pause_circle_filled,
                    color: Colors.white,
                  ),
                  top: 25,
                  left: 33,
                )
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    flex: 5,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: ListTile(
                        leading: Icon(Icons.search),
                        title: Text("Search", style: TextStyle(fontSize: 20)),
                        trailing: Icon(
                          Icons.qr_code_scanner,
                          size: 30,
                        ),
                      ),
                    )),
                Flexible(
                  flex: 1,
                  child: Icon(Icons.chat),
                )
              ],
            ));
}

class DashboardDrawer extends StatefulWidget {
  @override
  _DashboardDrawerState createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// Dashboard home widget
class DashboardHomeWidget extends StatefulWidget {
  @override
  _DashboardHomeWidgetState createState() => _DashboardHomeWidgetState();
}

class _DashboardHomeWidgetState extends State<DashboardHomeWidget> {
  List<Story> stories = [...List.generate(100, (index) => Story())];
  List<UserActivity> userActivities = [
    ...List.generate(100, (index) => UserActivity())
  ];
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, position) => StoryWidget(
                    stories[position],
                    isCreate: position == 0,
                  )),
        ),
        Expanded(
            child: ListView.builder(
                controller: scrollController,
                itemCount: userActivities.length,
                itemBuilder: (context, position) =>
                    UserActivityWidget(userActivities[position])))
      ],
    );
  }
}

class StoryWidget extends StatefulWidget {
  final Story story;
  final isCreate;

  StoryWidget(this.story, {this.isCreate = false});

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isCreate
        ? GestureDetector(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("resource/images/face.jpeg"),
                              fit: BoxFit.contain)),
                    ),
                    Positioned(
                      left: 45,
                      top: 55,
                      child: Icon(
                        Icons.add_circle,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    width: 70,
                    child: Text(
                      "Your Story",
                      overflow: TextOverflow.ellipsis,
                    ))
              ],
            ),
          )
        : Column(
            children: [
              Container(
                height: 70,
                width: 70,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.blue),
                    image: DecorationImage(
                        image: AssetImage("resource/images/face.jpeg"),
                        fit: BoxFit.contain)),
              ),
              SizedBox(
                  width: 70,
                  child: Text(
                    "Your Story",
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          );
  }
}

class UserActivityWidget extends StatefulWidget {

  final UserActivity userActivity;

  UserActivityWidget(this.userActivity);

  @override
  _UserActivityWidgetState createState() => _UserActivityWidgetState();
}

class _UserActivityWidgetState extends State<UserActivityWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,

            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 90,
                  child: ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        child: Image.asset("resource/images/face.jpeg")),
                    title: Text("Vishesh Pandey",
                     style: TextStyle(
                       fontWeight: FontWeight.w600
                     ),
                    ),
                    subtitle: Text("100M followers"),
                    trailing: Icon(Icons.expand_more),
                  ),
                ),
                SizedBox(
                 width: double.infinity,
                  child: ReadMoreText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer "
                      "took a galley of type and scrambled it to make a type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software like Aldus PageMaker including versions of "
                      "\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer "
                      "took a galley of type and scrambled it to make a type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software like Aldus PageMaker including versions of "
                      "\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer "
                      "took a galley of type and scrambled it to make a type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software like Aldus PageMaker including versions of"
                      "\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer "
                      "took a galley of type and scrambled it to make a type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software like Aldus PageMaker including versions of"
                      "\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer "
                      "took a galley of type and scrambled it to make a type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software like Aldus PageMaker including versions of"
                      "\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer "
                      "took a galley of type and scrambled it to make a type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software like Aldus PageMaker including versions of"
                      "\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer "
                      "took a galley of type and scrambled it to make a type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software like Aldus PageMaker including versions of"
                      "\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer "
                      "took a galley of type and scrambled it to make a type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software like Aldus PageMaker including versions of"

                  )
                  )
              ],
            ),
            
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Column(
              children: [
                 Padding(padding: EdgeInsets.symmetric(horizontal: 50),child: Divider(thickness: 1.5))
                ,Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        widget.userActivity.isLikedByMe ? Icon(Icons.thumb_up, color: Theme.of(context).primaryColor) :
                        Icon(Icons.thumb_up_alt_outlined),
                        Text("Like")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.comment_outlined),
                        Text("Like")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.share),
                        Text("Like")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.send),
                        Text("Like")
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
