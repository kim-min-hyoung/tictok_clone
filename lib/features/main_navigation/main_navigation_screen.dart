import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/stf_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widget/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widget/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

import '../../constants/gaps.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _seletedIndex = 0;
  // final bool _isSeleted = true;

  void _onTap(int index) {
    setState(() {
      _seletedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Record Video'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Offstage(
          offstage: _seletedIndex != 0,
          child: const VideoTimelineScreen(),
        ),
        Offstage(
          offstage: _seletedIndex != 1,
          child: const StfScreen(),
        ),
        Offstage(
          offstage: _seletedIndex != 3,
          child: const StfScreen(),
        ),
        Offstage(
          offstage: _seletedIndex != 4,
          child: const StfScreen(),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.size12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavTab(
                text: 'Home',
                icon: FontAwesomeIcons.house,
                seletedIcon: FontAwesomeIcons.house,
                isSeleted: _seletedIndex == 0,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: 'Discover',
                icon: FontAwesomeIcons.compass,
                seletedIcon: FontAwesomeIcons.solidCompass,
                isSeleted: _seletedIndex == 1,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                text: 'Inbox',
                icon: FontAwesomeIcons.message,
                seletedIcon: FontAwesomeIcons.solidMessage,
                isSeleted: _seletedIndex == 3,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: 'Profile',
                icon: FontAwesomeIcons.user,
                seletedIcon: FontAwesomeIcons.solidUser,
                isSeleted: _seletedIndex == 4,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



      // 머티리얼 디자인 3 - NavigationBar

      // bottomNavigationBar: NavigationBar(
      //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      //   backgroundColor: Colors.grey[350],
      //   surfaceTintColor: Colors.grey[350],
      //   shadowColor: Colors.grey[350],
      //   onDestinationSelected: _onTap,
      //   selectedIndex: _seletedIndex,
      //   destinations: [
      //     NavigationDestination(
      //       icon: FaIcon(
      //         FontAwesomeIcons.house,
      //         color: Colors.grey[600],
      //       ),
      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       icon: FaIcon(
      //         FontAwesomeIcons.magnifyingGlass,
      //         color: Colors.grey[600],
      //       ),
      //       label: 'Search',
      //     ),
      //     NavigationDestination(
      //       icon: FaIcon(
      //         FontAwesomeIcons.house,
      //         color: Colors.grey[600],
      //       ),
      //       label: 'home',
      //     ),
      //   ],
      // ),

      // 머티리얼 디자인 2 - BottomNavigationBar

      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: _onTap,
      //   currentIndex: _seletedIndex,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.house),
      //       label: 'Home',
      //       tooltip: "What are you?",
      //       backgroundColor: Colors.amber,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
      //       label: 'discover',
      //       tooltip: "What are you?",
      //       backgroundColor: Colors.amber,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.floppyDisk),
      //       label: 'save',
      //       tooltip: "What are you?",
      //       backgroundColor: Colors.amber,
      //     ),
      //   ],
      // ),