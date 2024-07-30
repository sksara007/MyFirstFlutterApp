import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedLoginBtn extends StatelessWidget {
  const AnimatedLoginBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
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
            controllers: [_btnAnimationController],
          ),
          const Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8),
                  Text("Login", style: TextStyle(fontWeight: FontWeight.w600)),
                  Icon(CupertinoIcons.right_chevron),
                ],
              )),
        ]),
      ),
    );
  }
}
