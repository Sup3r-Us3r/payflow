import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:animated_card/animated_card.dart';

class MyBoletosPage extends StatefulWidget {
  MyBoletosPage({Key? key}) : super(key: key);

  @override
  _MyBoletosPageState createState() => _MyBoletosPageState();
}

class _MyBoletosPageState extends State<MyBoletosPage> {
  final _boletoListController = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40.0,
                width: double.maxFinite,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: ValueListenableBuilder<List<BoletoModel>>(
                    valueListenable: _boletoListController.boletosNotifier,
                    builder: (_, boletos, __) => AnimatedCard(
                          direction: AnimatedCardDirection.top,
                          child: BoletoInfoWidget(
                            size: boletos.length,
                          ),
                        )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            child: Row(
              children: [
                Text(
                  'Meus boletos',
                  style: AppTextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
            child: Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: BoletoListWidget(
              boletoListController: _boletoListController,
            ),
          ),
        ],
      ),
    );
  }
}
