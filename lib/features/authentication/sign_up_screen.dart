import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/user_name_screen.dart';
import 'package:tiktok_clone/features/authentication/widget/aut_button.dart';
import 'package:tiktok_clone/utils.dart';

import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "/";

  const SignUpScreen({super.key});

  _onTapLogin(BuildContext context) {
    context.push(LoginScreen.routeName);
  }

  _onTapEmail(BuildContext context) {
    context.push(UserNameScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size36,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gaps.v80,
                  Text(
                    'Sign up for TikTok',
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  const Opacity(
                    opacity: 0.7,
                    child: Text(
                      'Create a profile, follow other accounts, make you own videos, and more',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Gaps.v36,
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => _onTapEmail(context),
                      child: const AuthButton(
                        text: 'Use phone or email',
                        icon: FaIcon(FontAwesomeIcons.user),
                      ),
                    ),
                    Gaps.v12,
                    const AuthButton(
                      text: 'Continue with Apple',
                      icon: FaIcon(FontAwesomeIcons.apple),
                    ),
                  ],
                  if (orientation == Orientation.landscape) ...[
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onTapEmail(context),
                            child: const AuthButton(
                              text: 'Use phone or email',
                              icon: FaIcon(FontAwesomeIcons.user),
                            ),
                          ),
                        ),
                        Gaps.h12,
                        const Expanded(
                          child: AuthButton(
                            text: 'Continue with Apple',
                            icon: FaIcon(FontAwesomeIcons.apple),
                          ),
                        ),
                      ],
                    )
                  ]
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: isDarkMode(context) ? null : Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(Sizes.size36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h6,
                  GestureDetector(
                    onTap: () => _onTapLogin(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
