import 'package:flutter/material.dart';
import 'package:flutter_practice5/supporting_elements/app_colors.dart';

import 'login_body.dart';

class LoginMainPage extends StatelessWidget {
  const LoginMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login to your rabbit page'),
          centerTitle: true,
          backgroundColor: AppColors.mainLightGreenColor,
        ),
        body: const LoginBody(),
      ),
    );
  }
}
