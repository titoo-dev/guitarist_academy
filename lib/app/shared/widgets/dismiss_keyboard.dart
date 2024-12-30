import 'package:flutter/widgets.dart';

class DissmisKeyboard extends StatelessWidget {
  const DissmisKeyboard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
