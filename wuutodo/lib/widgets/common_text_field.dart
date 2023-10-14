import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.labelText,
      this.readOnly = false,
      this.controller,
      this.MaxLines,
      this.sufficIcon});
  final String labelText;
  final TextEditingController? controller;
  final int? MaxLines;
  final Widget? sufficIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      TextField(
        readOnly: readOnly,
        maxLines: MaxLines,
        controller: controller,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration:
            InputDecoration(suffixIcon: sufficIcon, labelText: labelText),
        onChanged: (value) {},
      )
    ]);
  }
}
