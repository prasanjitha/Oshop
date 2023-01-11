import 'package:flutter/material.dart';
import 'package:oshop/views/on_board_screen/onboard_screen_three.dart';
import '../../widgets/custom_green_button.dart';
import '../../widgets/custom_white_button.dart';
import 'welcome_screen.dart';

class OnBoardScreenTwo extends StatelessWidget {
  const OnBoardScreenTwo({Key? key}) : super(key: key);

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
            Image.asset('assets/images/sc02.png'),
            Text(
              'Fast delivery',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 36.0,
                  ),
            ),
            Text(
              'Fast & free delivery to your home or office. We will deliver it, wherever you are!',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 18.0,
                  ),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/icons/slider_dot02.png'),
            CustomNextButton(
              tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const OnBoardScreenThree()),
                  ),
                );
              },
            ),
            CustomSkipButton(
              tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const WelcomeScreen()),
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
