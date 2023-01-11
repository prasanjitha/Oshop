import 'package:flutter/material.dart';
import 'package:oshop/views/on_board_screen/welcome_screen.dart';
import '../../widgets/custom_green_button.dart';
import '../../widgets/custom_white_button.dart';

class OnBoardScreenThree extends StatelessWidget {
  const OnBoardScreenThree({Key? key}) : super(key: key);

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
            Image.asset('assets/images/sc03.png'),
            Text(
              'Enjoy the experience',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 36.0,
                  ),
            ),
            Text(
              'Don’t feel like going out? No problem, we’ll deliver your order. In bed! :)',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 18.0,
                  ),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/icons/slider_dot03.png'),
            CustomNextButton(
              tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const WelcomeScreen()),
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
