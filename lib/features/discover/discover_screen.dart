import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

import '../../constants/breakpoints.dart';
import '../../constants/gaps.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController(
    text: 'Initial Text',
  );

  void _onSearchChanged(String value) {
    print('Search form $value');
  }

  void _onSearchSubmitted(String value) {
    print('Submitted $value');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.5,
          title: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: CupertinoSearchTextField(
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
              style: TextStyle(
                color: isDarkMode(context) ? Colors.white : Colors.black,
              ),
            ),
          ),
          bottom: TabBar(
            onTap: (value) => FocusScope.of(context).unfocus(),
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: isDarkMode(context) ? Colors.white : Colors.black,
            labelColor: isDarkMode(context) ? Colors.white : Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(
                Sizes.size10,
              ),
              itemCount: 20,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.lg ? 4 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (BuildContext context, int index) => LayoutBuilder(
                builder: (context, constraints) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size4,
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/placeholder.jpg',
                            image:
                                "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "is a very long caption for my tiktok that im upload just now currently.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gaps.v8,
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: Sizes.size16,
                            backgroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/3612017',
                            ),
                          ),
                          Gaps.h4,
                          Expanded(
                            child: Text(
                              'My avatar is going to be very long',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: isDarkMode(context)
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade700,
                              ),
                            ),
                          ),
                          const Opacity(
                            opacity: 0.7,
                            child: FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                            ),
                          ),
                          Gaps.h4,
                          Text(
                            '2.5M',
                            style: TextStyle(
                              color: isDarkMode(context)
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade700,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size24,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
