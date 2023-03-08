import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).muted,
            onChanged: (value) =>
                ref.read(playbackConfigProvider.notifier).setMuted(value),
            title: const Text("Auto Mute"),
            subtitle: const Text("Videos muted by default."),
          ),
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).autoplay,
            onChanged: (value) =>
                ref.read(playbackConfigProvider.notifier).setAutoplay(value),
            title: const Text("Enable notifications"),
            subtitle: const Text("Enable notifications"),
          ),
          CheckboxListTile(
            activeColor: Colors.black,
            value: false,
            onChanged: (value) {},
            title: const Text("Enable notifications"),
          ),
          ListTile(
            title: const Text('What is your birthday?'),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime(2026),
              );
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                        appBarTheme: const AppBarTheme(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black)),
                    child: child!,
                  );
                },
              );
            },
          ),
          const AboutListTile(
            applicationVersion: "1.0",
            applicationLegalese: "Don't copy me.",
          ),
          ListTile(
            title: const Text('Log out (iso)'),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text("Plx dont go"),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('No'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (Android)"),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const FaIcon(FontAwesomeIcons.skull),
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(FontAwesomeIcons.car),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (iOS / Bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Are you sure?"),
                  message: const Text("Please dooooont gooooo"),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Not log out"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes plz."),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


/*
ListWheelScrollView(
  itemExtent: 100,
  offAxisFraction: 0,
  diameterRatio: 2,
  children: [
    for (var x in [1, 2, 2, 1, 1, 1, 1, 1])
      FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          color: Colors.teal,
          alignment: Alignment.center,
          child: const Text(
            'Pick me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 39,
            ),
          ),
        ),
      )
  ],
),

ListTile(
  onTap: () => showAboutDialog(
      context: context,
      applicationVersion: "1.0",
      applicationLegalese:
          "All rights reseverd. Please dont copy me."),
  title: const Text(
    "About",
    style: TextStyle(
      fontWeight: FontWeight.w600,
    ),
  ),
  subtitle: const Text("About this app....."),
),

*/

