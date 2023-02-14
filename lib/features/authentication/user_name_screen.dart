import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final TextEditingController _userNameController = TextEditingController();

  String _userName = '';

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(() {
      setState(() {
        _userName = _userNameController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v16,
            const Text(
              'Create username',
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v6,
            const Text(
              'you can always change this later',
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w400,
                color: Colors.black38,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: 'Username',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v20,
            FractionallySizedBox(
              widthFactor: 1,
              child: AnimatedContainer(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size16,
                ),
                decoration: BoxDecoration(
                  color: _userName.isEmpty
                      ? Colors.grey[400]
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(
                    Sizes.size5,
                  ),
                ),
                duration: const Duration(milliseconds: 300),
                child: const Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
