import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/common/widget/main_navigation/widget/nav_tab.dart';
import 'package:tiktok_clone/common/widget/main_navigation/widget/post_video_button.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/utils.dart';

import '../../../constants/gaps.dart';
import '../../../features/videos/views/video_recording_screen.dart';
import '../../../features/videos/views/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "discover",
    "xxxx",
    "inbox",
    "profile",
  ];

  late int _selectedIndx = _tabs.indexOf(widget.tab);

  // final bool _isSeleted = true;

  void _onTap(int index) {
    context.go('/${_tabs[index]}');

    setState(() {
      _selectedIndx = index;
    });
  }

  void _onPostVideoButtonTap() {
    context.pushNamed(VideoRecordingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIndx == 0 ? Colors.black : Colors.white,
      body: Stack(children: [
        Offstage(
          offstage: _selectedIndx != 0,
          child: const VideoTimelineScreen(),
        ),
        Offstage(
          offstage: _selectedIndx != 1,
          child: const DiscoverScreen(),
        ),
        Offstage(
          offstage: _selectedIndx != 3,
          child: const InboxScreen(),
        ),
        Offstage(
          offstage: _selectedIndx != 4,
          child: const UserProfileScreen(
            username: 'alsgud',
            tab: '',
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: isDarkMode(context)
            ? Colors.black
            : _selectedIndx == 0
                ? Colors.black
                : Colors.white,
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
                isSeleted: _selectedIndx == 0,
                selectedIndex: _selectedIndx,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: 'Discover',
                icon: FontAwesomeIcons.compass,
                seletedIcon: FontAwesomeIcons.solidCompass,
                isSeleted: _selectedIndx == 1,
                selectedIndex: _selectedIndx,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(
                  inverted: _selectedIndx != 0,
                ),
              ),
              Gaps.h24,
              NavTab(
                text: 'Inbox',
                icon: FontAwesomeIcons.message,
                seletedIcon: FontAwesomeIcons.solidMessage,
                isSeleted: _selectedIndx == 3,
                selectedIndex: _selectedIndx,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: 'Profile',
                icon: FontAwesomeIcons.user,
                seletedIcon: FontAwesomeIcons.solidUser,
                isSeleted: _selectedIndx == 4,
                selectedIndex: _selectedIndx,
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
      //   selectedIndex: _selectedIndx,
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
      //   currentIndex: _selectedIndx,
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