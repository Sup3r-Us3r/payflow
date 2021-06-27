import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;

  LabelButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: style ?? AppTextStyles.buttonHeading,
        ),
      ),
    );
  }
}
