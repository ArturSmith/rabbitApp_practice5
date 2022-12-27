import 'package:flutter/material.dart';
import 'package:flutter_practice5/supportingElements/appColors.dart';

import '../supportingElements/commonUsedMethods.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login to your rabbit page'),
          centerTitle: true,
          backgroundColor: MyColors.mainLightGreenColor,
        ),
        body: const LoginPageBody(),
      ),
    );
  }
}

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  Color errorColor = MyColors.mainLightGreenColor;
  String? errorText;

  void Login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username != '' && password != '') {
      errorText = null;
      errorColor = MyColors.mainLightGreenColor;

      if (username == "admin" && password == "12345") {
        errorText = null;
        errorColor = MyColors.mainLightGreenColor;

        final navigator = Navigator.of(context);
        navigator.pushReplacementNamed("/HomePage");
      } else {
        errorColor = Colors.red;
        errorText = "Wrong username or password, try again...";
      }
    } else {
      errorColor = MyColors.mainLightGreenColor;

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
                color: MyColors.mainLightGreenColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'RABBIT',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: MyColors.mainLightGreenColor),
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
                decoration:
                    TextFieldDecoration("Username", errorColor, errorColor)
                        .ChangeTextFieldBorderDecoration(),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration:
                    TextFieldDecoration("Password", errorColor, errorColor)
                        .ChangeTextFieldBorderDecoration(),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyColors.mainLightGreenColor),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    )),
                onPressed: Login,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
