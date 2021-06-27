import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  final BoletoListController _boletoListController = BoletoListController();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? 'O nome não pode ser vazio' : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? 'A data de vencimento não pode ser vazio' : null;
  String? validateValor(double value) =>
      value == 0 ? 'Insira um valor maior que R\$ 0,00' : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? 'O código do boleto não pode ser vazio' : null;

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBoleto() async {
    final _prefs = await SharedPreferences.getInstance();
    final boletos = _prefs.getStringList('@payflow/boletos') ?? <String>[];

    boletos.add(model.toJson());

    await _prefs.setStringList('@payflow/boletos', boletos);

    return await _boletoListController.getBoletos();
  }

  Future<void> registerBoleto() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      return await saveBoleto();
    }
  }
}
