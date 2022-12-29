import 'package:flutter/material.dart';
import 'package:flutter_practice5/supporting_elements/app_colors.dart';
import 'package:flutter_practice5/supporting_elements/text_field_border_decoration.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  Color errorColor = AppColors.mainLightGreenColor;
  String? errorText;

  void login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username != '' && password != '') {
      errorText = null;
      errorColor = AppColors.mainLightGreenColor;

      if (username == "admin" && password == "12345") {
        errorText = null;
        errorColor = AppColors.mainLightGreenColor;

        final navigator = Navigator.of(context);
        navigator.pushReplacementNamed("/HomePage");
      } else {
        errorColor = Colors.red;
        errorText = "Wrong username or password, try again...";
      }
    } else {
      errorColor = AppColors.mainLightGreenColor;

      errorText = "Write username and password";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cruelty_free,
                size: 130,
                color: AppColors.mainLightGreenColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'RABBIT',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: AppColors.mainLightGreenColor),
              ),
              const SizedBox(
                height: 60,
              ),
              if (errorText != null) ...[
                Text(
                  errorText!,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
              TextField(
                controller: _usernameController,
                decoration: TextFieldBorderDecoration(
                        "Username", errorColor, errorColor)
                    .setTextFieldBorderDecoration(),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: TextFieldBorderDecoration(
                        "Password", errorColor, errorColor)
                    .setTextFieldBorderDecoration(),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        AppColors.mainLightGreenColor),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    )),
                onPressed: login,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
