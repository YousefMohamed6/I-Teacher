import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).secondaryHeaderColor
          ],
        ),
      ),
      child: child,
    );
  }
}
