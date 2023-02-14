import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/user_name_screen.dart';
import 'package:tiktok_clone/features/authentication/widget/aut_button.dart';

import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  _onTapLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  _onTapEmail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserNameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v80,
              const Text(
                'Sign up for TikTok',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              const Text(
                'Create a profile, follow other accounts, make you own videos, and more',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
              ),
              Gaps.v36,
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
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
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
