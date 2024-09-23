// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:chat_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool isLoading = false;
  bool isHiding = true;

  LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatView.id, arguments: email);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMsg, Colors.red);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Image.asset('assets/images/scholar.png'),
                    const Text(
                      'ScholarChat',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Pacifico',
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Row(
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      obscureText: isHiding,
                      onChanged: (value) {
                        password = value;
                      },
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isHiding = !isHiding;
                        },
                        child: isHiding
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                              AuthLogin(email: email!, password: password!));
                        } else {}
                      },
                      name: 'LOGIN',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "don't have an Account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterView.id);
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Color(0xffC7EDE6),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
