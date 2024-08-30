import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: RegisterViewBody(),
    );
  }
}
