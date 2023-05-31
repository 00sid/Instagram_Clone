import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_clone/screens/login_screen.dart';
import 'package:insta_clone/widgets/widget.dart';

import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _bioController = TextEditingController();
  @override
  void dispose() {
    _bioController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //logo
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                height: 64,
                // ignore: deprecated_member_use
                color: primaryColor,
              ),
              const SizedBox(
                height: 64,
              ),
              // circular wigdet to accept and show our selected file
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://wallpaperaccess.com/full/1111744.jpg'),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo),
                      ))
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              //userName
              TextFieldInput(
                textEditingController: _userNameController,
                hintText: "Enter your name",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
              ),
              //email
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              //password
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              //bio
              TextFieldInput(
                textEditingController: _bioController,
                hintText: "Enter your bio",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
              ),
              //login button
              Button(child: "Sign up", ontap: () {}),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //transitoning to signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Already have an account?",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      nextScreen(
                        context,
                        const LoginScreen(),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
