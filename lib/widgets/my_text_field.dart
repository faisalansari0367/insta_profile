import 'package:flutter/material.dart';
import 'package:insta_profile/utils/my_decoration.dart';

class MyTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Color? fillColor;
  final void Function(String)? onSubmitted;
  const MyTextField({
    Key? key,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.onSubmitted,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? theme.inputDecorationTheme.fillColor,
        hintText: hintText,
        hintStyle: TextStyle(color: theme.iconTheme.color),
        filled: true,
        focusColor: theme.primaryColor,
        enabledBorder: MyDecoration.inputBorder,
        focusedBorder: MyDecoration.inputBorder,
        border: MyDecoration.inputBorder,
        // contentPadding: EdgeInsets.only(left: .padding),
      ),
    );
  }
}
