import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'package:payflow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button_widget.dart';

class SetLabelButtonsWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;
  SetLabelButtonsWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57.0,
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56.0,
            child: Row(
              children: [
                Expanded(
                  child: LabelButtonWidget(
                    label: primaryLabel,
                    onPressed: primaryOnPressed,
                    style:
                        enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
                  ),
                ),
                DividerVerticalWidget(),
                Expanded(
                  child: LabelButtonWidget(
                    label: secondaryLabel,
                    onPressed: secondaryOnPressed,
                    style: enableSecondaryColor
                        ? AppTextStyles.buttonPrimary
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
