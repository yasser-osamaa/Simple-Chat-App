import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Image.asset('assets/images/scholar.png'),
          const Text(
            'ScholarChat',
            style: TextStyle(
                fontSize: 32, fontFamily: 'Pacifico', color: Colors.white),
          ),
          const Spacer(
            flex: 2,
          ),
          const Row(
            children: [
              Text(
                'REGISTER',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            hintText: 'Email',
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            hintText: 'Password',
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomButton(
            name: 'REGISTER',
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an Account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xffC7EDE6),
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
