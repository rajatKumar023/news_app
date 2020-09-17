import 'package:flutter/material.dart';
import 'package:news_app/utils/styles.dart';

class ScrollButton extends StatelessWidget {
  ScrollButton({
    this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Styles.BLUE_COLOR,
      onPressed: () {
        onTap();
      },
      child: Icon(
        Icons.arrow_upward,
        color: Styles.WHITE_COLOR,
      ),
    );
  }
}
