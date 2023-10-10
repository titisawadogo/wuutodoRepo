import 'package:flutter/material.dart';
import 'package:wuutodo/utils/utils.dart';

class DisplayWHiteText extends StatelessWidget {
  const DisplayWHiteText(
      {super.key, required this.text, this.fontsize, this.fontweight});

  final String text;
  final double? fontsize;
  final FontWeight? fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
          color: context.colorScheme.surface,
          fontSize: fontsize,
          fontWeight: fontweight ?? FontWeight.bold),
    );
  }
}
