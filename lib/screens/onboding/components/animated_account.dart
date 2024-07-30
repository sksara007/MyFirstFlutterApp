import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedAccountBtn extends StatelessWidget {
  const AnimatedAccountBtn({
    super.key,
    required RiveAnimationController btnAnimationController2,
    required this.press,
  }) : _btnAnimationController2 = btnAnimationController2;

  final RiveAnimationController _btnAnimationController2;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(children: [
          RiveAnimation.asset(
            "assets/RiveAssets/button.riv",
            controllers: [_btnAnimationController2],
          ),
          const Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.bars),
                  SizedBox(width: 8),
                  Text("Linked Accounts", style: TextStyle(fontWeight: FontWeight.w600))
                ],
              )),
        ]),
      ),
    );
  }
}
