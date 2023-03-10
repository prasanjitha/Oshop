import 'package:flutter/material.dart';
import 'package:oshop/views/on_board_screen/onboard_screen_two.dart';
import 'package:oshop/views/on_board_screen/welcome_screen.dart';
import '../../widgets/custom_green_button.dart';
import '../../widgets/custom_white_button.dart';

class OnBoardScreenOne extends StatelessWidget {
  const OnBoardScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/icons/logo_icon.png'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/sc01.png'),
            Text(
              'Find food you love',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 36.0,
                  ),
            ),
            Text(
              'Discover the best menus from over 100 cuisines and over 1000 restaurants.',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 18.0,
                  ),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/icons/slider_dot01.png'),
            CustomNextButton(
              tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const OnBoardScreenTwo()),
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
