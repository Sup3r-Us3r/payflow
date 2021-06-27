import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          TextFormField(
            initialValue: initialValue,
            validator: validator,
            controller: controller,
            style: AppTextStyles.input,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: AppTextStyles.input,
              contentPadding: EdgeInsets.zero,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Icon(
                      icon,
                      color: AppColors.primary,
                    ),
                  ),
                  Container(
                    height: 48.0,
                    width: 1.0,
                    color: AppColors.stroke,
                  ),
                ],
              ),
              border: InputBorder.none,
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: AppColors.stroke,
          ),
        ],
      ),
    );
  }
}
