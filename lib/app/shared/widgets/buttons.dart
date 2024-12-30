import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({super.key, required this.onPressed});

  // onPressed
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      textColor: Theme.of(context).colorScheme.onPrimary,
      minWidth: 0,
      padding: EdgeInsets.all(14.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Icon(Icons.arrow_forward_outlined),
    );
  }
}

class BackwardButton extends StatelessWidget {
  const BackwardButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Theme.of(context).colorScheme.primary,
      minWidth: 0,
      padding: EdgeInsets.all(14.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Icon(Icons.arrow_back_outlined),
    );
  }
}
