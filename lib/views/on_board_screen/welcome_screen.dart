import 'package:flutter/material.dart';
import 'package:oshop/views/Authentication/signup_page/signup_page_provider.dart';
import '../../widgets/custom_green_button.dart';
import '../../widgets/custom_white_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/icons/logo_icon.png'),
        leading: const Text(''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/sc04.png'),
            Text(
              'Welcome to hngry',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 36.0,
                  ),
            ),
            Text(
              'Craving for your favourite food? Takeaway will deliver it, wherever you are!',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 18.0,
                  ),
              textAlign: TextAlign.center,
            ),
            CustomNextButton(
              btnText: 'Sign in',
              tap: () {
                //  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => )))
              },
            ),
            CustomSkipButton(
              btnText: 'Sign up',
              tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => SignUpPageProvider()),
                  ),
                );
              },
            ),
            Image.asset('assets/icons/bottom_line.png'),
          ],
        ),
      ),
    );
  }
}
