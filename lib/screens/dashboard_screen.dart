import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linkedin_clone/providers/stories.dart';

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
  List<Story> stories = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(itemBuilder: (context,position) => StoryWidget()
          ),
        )
      ],
    );
  }
}

class StoryWidget extends StatefulWidget {
  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

