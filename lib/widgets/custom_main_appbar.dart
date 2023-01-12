import 'package:flutter/material.dart';

import '../theme/custom_colors.dart';

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
