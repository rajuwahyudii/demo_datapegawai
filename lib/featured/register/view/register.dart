import 'package:demo/constants/asset/images.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/register/view_model/register_view_model.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/button_widget.dart';
import 'package:demo/shared/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _namaController = TextEditingController(text: '');
  final TextEditingController _alamatController =
      TextEditingController(text: '');
  final TextEditingController _nikController = TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  final TextEditingController _motorController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.greenColor,
      body: SafeArea(
        child: Container(
            width: getWidth(context),
            height: getHeight(context),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Register',
                    style: MyTextStyle.headerWhiteBold22,
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    AssetImages.imageLogin,
                    width: getWidth(context) * 0.5,
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
                    controller: _namaController,
                    keyboardType: TextInputType.name,
                    hint: 'Nama',
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    controller: _alamatController,
                    keyboardType: TextInputType.name,
                    hint: 'Alamat',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    controller: _nikController,
                    keyboardType: TextInputType.name,
                    hint: 'NIK/SIM/Passport',
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    controller: _motorController,
                    keyboardType: TextInputType.name,
                    hint: 'Merk Motor',
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    keyboardType: TextInputType.name,
                    controller: _passwordController,
                    hint: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    color: MyColor.mainColor,
                    textColor: MyColor.greenColor,
                    label: 'Register',
                    function: () {
                      getIt<RegisterViewModel>().doRegister(
                        context,
                        _emailController.text,
                        _passwordController.text,
                        _namaController.text,
                        _nikController.text,
                        _alamatController.text,
                        _motorController.text,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sudah Punya Akun ?',
                        style: MyTextStyle.captionWhiteSemiBold16,
                      ),
                      TextButton(
                          onPressed: () {
                            Routes.goLogin();
                          },
                          child: const Text(
                            'Login',
                            style: MyTextStyle.captionLightGreySemiBold16,
                          ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
