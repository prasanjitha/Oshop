import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:oshop/theme/custom_colors.dart';

import '../../../widgets/custom_green_button.dart';
import '../../on_board_screen/welcome_screen.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController rePasswordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomMainAppBar(
        appBarText: 'Sign in',
        tap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const WelcomeScreen()),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Let\'s create your foodly account',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 36.0,
                    ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Enter username',
                      controller: usernameTextEditingController,
                      validatorText: "Username is required",
                    ),
                    CustomTextFormField(
                      hintText: 'Enter email',
                      controller: emailTextEditingController,
                      validatorText: "Email is required",
                    ),
                    CustomTextFormField(
                      hintText: 'Enter password',
                      controller: passwordTextEditingController,
                      validatorText: "Password is required",
                    ),
                    CustomTextFormField(
                      hintText: 'Re enter password',
                      controller: rePasswordTextEditingController,
                      validatorText: "Pleasr re-enter password",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.15,
              ),
              Column(
                children: [
                  Text(
                    'By signing up you accept the Terms of Service and Privacy Policy.',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 16.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomNextButton(
                    btnText: 'Sign up',
                    tap: () {
                      if (_formKey.currentState!.validate()) {
                        log(emailTextEditingController.text);
                      }
                    },
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

class CustomTextFormField extends StatelessWidget {
  final String validatorText;
  final String hintText;
  final TextEditingController controller;
  const CustomTextFormField({
    Key? key,
    required this.validatorText,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: CustomColors.PRIMARY,
      validator: RequiredValidator(errorText: validatorText),
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: CustomColors.PRIMARY,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: CustomColors.PRIMARY,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback tap;
  final String appBarText;
  const CustomMainAppBar({
    Key? key,
    required this.appBarText,
    required this.tap,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(90);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(0, 90),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppBar(
          primary: false,
          leading: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: InkWell(
              onTap: tap,
              child: Text(
                appBarText,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 18.0, color: CustomColors.ONSURFACE),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          title: Image.asset('assets/icons/logo_icon.png'),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                color: CustomColors.ONSURFACE,
              ),
            )
          ],
        ),
      ),
    );
  }
}
