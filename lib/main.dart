import 'package:Fproject/pages/dashboard-page.dart';
import 'package:Fproject/pages/group-page.dart';
import 'package:Fproject/pages/home-page.dart';
import 'package:Fproject/pages/menu-page.dart';
import 'package:Fproject/pages/noti-page.dart';
import 'package:Fproject/pages/video-page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        tabBarTheme: TabBarTheme(
          //indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController();
  int _index = 0;
  List<Widget> screens = [
    HomePage(),
    GroupPage(),
    DashBoardPage(),
    NotiPage(),
    VideoPage(),
    MenuPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Home"),
        ),
        body: PageView(children: screens, controller: _pageController,),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) {
            setState(() {
              _index = i;
              _pageController.jumpToPage(i);
            });
          },
          type: BottomNavigationBarType.fixed,
          items: AppBarMenu.values
              .map((value) => BottomNavigationBarItem(
                  label: value.appBarLabel, icon: Icon(value.appBarIcon)))
              .toList(),
        ));
  }
}

enum AppBarMenu { Home, Group, Video, Noti, DashBoard, Menu }

extension AppBarMenuExtension on AppBarMenu {
  String get appBarLabel {
    switch (this) {
      case AppBarMenu.Home:
        return "Home";
        break;
      case AppBarMenu.Group:
        return "Group";
        break;
      case AppBarMenu.Video:
        return "Video";
        break;
      case AppBarMenu.Noti:
        return "Noti";
        break;
      case AppBarMenu.DashBoard:
        return "DashBoard";
        break;
      case AppBarMenu.Menu:
        return "Menu";
        break;

      default:
        return null;
    }
  }

  IconData get appBarIcon {
    switch (this) {
      case AppBarMenu.Home:
        return Icons.home;
        break;
      case AppBarMenu.Group:
        return Icons.group;
        break;
      case AppBarMenu.Video:
        return Icons.video_library;
        break;
      case AppBarMenu.Noti:
        return Icons.notification_important;
        break;
      case AppBarMenu.DashBoard:
        return Icons.dashboard;
        break;
      case AppBarMenu.Menu:
        return Icons.menu;
        break;
      default:
        return null;
    }
  }
}
