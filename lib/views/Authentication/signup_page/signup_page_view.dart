import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:oshop/theme/custom_colors.dart';
import 'package:oshop/views/Authentication/signup_page/signup_page_event.dart';
import '../../../widgets/custom_green_button.dart';
import '../../../widgets/custom_main_appbar.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../on_board_screen/welcome_screen.dart';
import 'signup_page_bloc.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final _formKey = GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'email is required'),
    EmailValidator(errorText: "Email is required"),
  ]);
  bool _obscureTextConPassword = true;
  @override
  Widget build(BuildContext context) {
    final SignUpPageBloc bloc = BlocProvider.of<SignUpPageBloc>(context);
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
                      controller: bloc.usernameTextEditingController,
                      validator:
                          RequiredValidator(errorText: 'Username is required'),
                    ),
                    CustomTextFormField(
                      hintText: 'Enter email',
                      validator: emailValidator,
                      controller: bloc.emailTextEditingController,
                    ),
                    CustomTextFormField(
                      validator: passwordValidator,
                      hintText: 'Enter password',
                      controller: bloc.passwordTextEditingController,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: bloc.rePasswordTextEditingController,
                      obscureText: _obscureTextConPassword,
                      keyboardType: TextInputType.text,
                      validator: (val) => MatchValidator(
                              errorText: 'passwords do not match')
                          .validateMatch(val!,
                              bloc.passwordTextEditingController.text.trim()),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureTextConPassword =
                                  !_obscureTextConPassword;
                            });
                          },
                          child: Icon(
                            _obscureTextConPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: CustomColors.PRIMARY,
                            size: 24.0,
                          ),
                        ),
                        isDense: true,
                        hintText: 'Re Enter Password',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.PRIMARY),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.PRIMARY),
                        ),
                      ),
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
                      try {
                        if (_formKey.currentState!.validate()) {
                          bloc.add(
                            SubmitUserDataEvent(
                              email:
                                  bloc.emailTextEditingController.text.trim(),
                              username: bloc.usernameTextEditingController.text
                                  .trim(),
                              password: bloc.passwordTextEditingController.text
                                  .trim(),
                              repsd: bloc.rePasswordTextEditingController.text
                                  .trim(),
                            ),
                          );
                        }
                      } catch (e) {
                        Future.error(e.toString());
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
