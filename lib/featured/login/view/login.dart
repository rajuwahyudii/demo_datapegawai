import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/login/view_model/login_view_model.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/button_widget.dart';
import 'package:demo/shared/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: getWidth(context),
          color: MyColor.greenColor,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: MyTextStyle.headerWhiteBold22,
              ),
              const SizedBox(height: 20),
              MyTextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                hint: 'Email',
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              MyTextFormField(
                obscureText: true,
                controller: _passwordController,
                hint: 'Password',
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                color: MyColor.mainColor,
                textColor: MyColor.greenColor,
                label: 'Login',
                function: () {
                  getIt<LoginViewModel>().doLogin(
                      context, _emailController.text, _passwordController.text);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Tidak Punya Akun ?',
                    style: MyTextStyle.captionWhiteSemiBold16,
                  ),
                  TextButton(
                      onPressed: () {
                        Routes.goRegister();
                      },
                      child: const Text(
                        'Register',
                        style: MyTextStyle.captionLightGreySemiBold16,
                      ))
                ],
              )
            ],
          )),
    );
  }
}
