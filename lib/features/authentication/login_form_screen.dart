import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/widget/form_button.dart';

import '../../constants/sizes.dart';
import '../onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formkey.currentState != null) {
      if (_formkey.currentState!.validate()) {
        _formkey.currentState!.save();

        context.goNamed(InterestsSceen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size36),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Plase write your email';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['email'] = newValue;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'email',
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
                  Gaps.v8,
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Plase write your password';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['password'] = newValue;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'password',
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
                ],
              ),
            ),
            Gaps.v28,
            GestureDetector(
              onTap: _onSubmitTap,
              child: const FormButton(
                disabled: false,
                text: 'Log in',
              ),
            )
          ],
        ),
      ),
    );
  }
}
