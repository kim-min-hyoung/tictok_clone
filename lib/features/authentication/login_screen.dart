import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widget/aut_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  _onTapSignup(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Gaps.v80,
              Text(
                'Log in to TikTok',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              Text(
                'Manage your account, check notifications, comment on videos, and more',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
              ),
              Gaps.v36,
              AuthButton(
                text: 'Use phone / email',
                icon: FaIcon(FontAwesomeIcons.user),
              ),
              Gaps.v12,
              AuthButton(
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
