import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:oshop/theme/custom_colors.dart';

import '../../../widgets/custom_green_button.dart';
import '../../on_board_screen/welcome_screen.dart';

class AdditionalInfoPageView extends StatefulWidget {
  const AdditionalInfoPageView({Key? key}) : super(key: key);

  @override
  _AdditionalInfoPageViewState createState() => _AdditionalInfoPageViewState();
}

class _AdditionalInfoPageViewState extends State<AdditionalInfoPageView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController provinceTextEditingController =
      TextEditingController();
  final TextEditingController districTextEditingController =
      TextEditingController();
  final TextEditingController townTextEditingController =
      TextEditingController();
  final TextEditingController postalCodeTextEditingController =
      TextEditingController();
  var currentSelectedValue;
  List<String> gender = [
    "Central Province",
    "Eastern Province",
    "Northern Province",
    "Southern Province",
    "Western Province",
    "North Western Province",
    "North Central Province ",
    "Uva Province ",
    "Sabaragamuwa Province",
  ];
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
              left: 20.0, right: 20.0, bottom: 20.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Additional Information',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 36.0,
                    ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Image.asset('assets/images/CompositeLayer.png'),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      hintText: 'Name',
                      controller: nameTextEditingController,
                      validatorText: "Name is required",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Province',
                      textAlign: TextAlign.start,
                    ),
                    InputDecorator(
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.PRIMARY),
                        ),
                        errorStyle: const TextStyle(fontSize: 0.012),
                        hintText: '',
                        isDense: true,
                        contentPadding: const EdgeInsets.fromLTRB(1, 2, 0, 0),
                        hintStyle: Theme.of(context).textTheme.subtitle1,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: CustomColors.PRIMARY, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text(
                            '',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          value: currentSelectedValue,
                          isDense: true,
                          isExpanded: true,
                          onChanged: (String? newValue) {},
                          items: gender.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      hintText: 'Distric',
                      controller: districTextEditingController,
                      validatorText: "Distric is required",
                    ),
                    CustomTextFormField(
                      hintText: 'Town',
                      controller: townTextEditingController,
                      validatorText: "Town is required",
                    ),
                    CustomTextFormField(
                      hintText: 'Postal code',
                      controller: postalCodeTextEditingController,
                      validatorText: "Postal code is required",
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
                          fontSize: 14.0,
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
                        log(nameTextEditingController.text);
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
