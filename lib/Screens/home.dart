import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_singing/Screens/Dashbord.dart';
import 'package:flutter_singing/Screens/History.dart';
import 'package:flutter_singing/Screens/Suppport.dart';
import 'package:flutter_singing/Screens/Usage.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var _islogin = true;
final _firebase = FirebaseAuth.instance;
User? _curentUser = FirebaseAuth.instance.currentUser;

class _MyHomePageState extends State<MyHomePage> {
  int _selected_index = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selected_index,
        children: [
          DashBoard(),
          UsagePage(),
          HistoryPage(),
          SupportPage(),
        ],

      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.data_usage, title: 'Usage'),
          TabItem(icon: Icons.history, title: 'Histoy'),
          TabItem(icon: Icons.support_agent, title: 'Support'),
        ],
        initialActiveIndex: _selected_index,
        onTap: (int index) {
          setState(() {
            _selected_index = index;
          });
          _pageController.jumpToPage(index);
        },
        style: TabStyle.titled,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}


