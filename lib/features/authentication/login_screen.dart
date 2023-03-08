import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_form_screen.dart';
import 'package:tiktok_clone/features/authentication/widget/aut_button.dart';

import '../../utils.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "login";
  static String routeURL = "/login";

  const LoginScreen({super.key});

  _onTapSignup(BuildContext context) {
    Navigator.pop(context);
  }

  _onTapLoginForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v80,
              Text(
                'Log in to TikTok',
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v16,
              const Opacity(
                opacity: 0.7,
                child: Text(
                  'Manage your account, check notifications, comment on videos, and more',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Gaps.v36,
              GestureDetector(
                onTap: () => _onTapLoginForm(context),
                child: const AuthButton(
                  text: 'Use phone / email',
                  icon: FaIcon(FontAwesomeIcons.user),
                ),
              ),
              Gaps.v12,
              const AuthButton(
                text: 'Continue with Apple',
                icon: FaIcon(FontAwesomeIcons.apple),
              ),
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
                'Don\'t have an account?',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.h6,
              GestureDetector(
                onTap: () => _onTapSignup(context),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
