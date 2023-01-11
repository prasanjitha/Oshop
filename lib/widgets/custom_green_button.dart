import 'package:flutter/material.dart';

import '../theme/custom_colors.dart';

class CustomNextButton extends StatelessWidget {
  final VoidCallback tap;
  final String btnText;
  const CustomNextButton({Key? key, required this.tap, this.btnText = 'Next'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: double.infinity,
        height: 46.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: CustomColors.PRIMARY,
        ),
        child: Center(
          child: Text(btnText,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: CustomColors.BACKGROUND,
                  )),
        ),
      ),
    );
  }
}
