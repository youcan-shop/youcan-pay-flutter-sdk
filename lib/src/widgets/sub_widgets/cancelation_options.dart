import 'package:flutter/material.dart';

class CancellationIconButton extends StatelessWidget {
  const CancellationIconButton({
    super.key,
    required this.onCloseIconPressed,
  });

  final void Function() onCloseIconPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Size.infinite.width,
      child: ColoredBox(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: onCloseIconPressed,
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 28,
                )),
          ],
        ),
      ),
    );
  }
}
