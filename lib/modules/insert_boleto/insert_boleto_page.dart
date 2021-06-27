import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

class InsertBoletoPatge extends StatefulWidget {
  final String? barcode;

  InsertBoletoPatge({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPatgeState createState() => _InsertBoletoPatgeState();
}

class _InsertBoletoPatgeState extends State<InsertBoletoPatge> {
  @override
  void initState() {
    super.initState();

    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
  }

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: 'R\$',
    decimalSeparator: ',',
  );
  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  final InsertBoletoController _insertBoletoController =
      InsertBoletoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColors.input),
        elevation: 0.0,
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 93.0),
                child: Text(
                  'Preencha os dados do boleto',
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24.0),
              Form(
                key: _insertBoletoController.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: 'Nome do boleto',
                      icon: Icons.description_outlined,
                      onChanged: (value) {
                        _insertBoletoController.onChange(name: value);
                      },
                      validator: _insertBoletoController.validateName,
                    ),
                    InputTextWidget(
                      label: 'Vencimento',
                      icon: FontAwesomeIcons.timesCircle,
                      onChanged: (value) {
                        _insertBoletoController.onChange(dueDate: value);
                      },
                      controller: dueDateInputTextController,
                      validator: _insertBoletoController.validateVencimento,
                    ),
                    InputTextWidget(
                      label: 'Valor',
                      icon: FontAwesomeIcons.wallet,
                      onChanged: (value) {
                        _insertBoletoController.onChange(
                          value: moneyInputTextController.numberValue,
                        );
                      },
                      controller: moneyInputTextController,
                      validator: (_) => _insertBoletoController.validateValor(
                        moneyInputTextController.numberValue,
                      ),
                    ),
                    InputTextWidget(
                      label: 'Código',
                      icon: FontAwesomeIcons.barcode,
                      onChanged: (value) {
                        _insertBoletoController.onChange(barcode: value);
                      },
                      controller: barcodeInputTextController,
                      validator: _insertBoletoController.validateCodigo,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtonsWidget(
        primaryLabel: 'Calcelar',
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: 'Cadastrar',
        secondaryOnPressed: () async {
          await _insertBoletoController.registerBoleto();
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
      backgroundColor: AppColors.background,
    );
  }
}
