import 'package:flutter/material.dart';
import 'package:instac/home/presentation/pages/create_post_page.dart';
import 'package:instac/home/presentation/pages/home.dart';
import 'package:instac/home/presentation/pages/notification_page.dart';
import 'package:instac/home/presentation/pages/profile_page.dart';
import 'package:instac/home/presentation/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> page = [
    const HomePage(),
    const SearchPage(),
    const CreatePostPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];
  int pageindex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[pageindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageindex,
        onTap: (value) {
          setState(() {
            pageindex = value;
          });
        },
        showSelectedLabels: false,
        iconSize: 30,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 136, 136, 136),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'searhc'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_sharp), label: 'create'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
