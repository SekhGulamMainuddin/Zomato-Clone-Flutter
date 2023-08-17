import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zomato_clone/common/widgets/progress_bar_with_text.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
void showLoaderDialog(BuildContext context){
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return const ProgressBarWithText(text: "Verifying Credentials");
    },
  );
}

String _currencySymbol = "";

String getCurrencySymbol(BuildContext context) {
  if (_currencySymbol.isEmpty) {
    _currencySymbol = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString())
        .currencySymbol;
  }
  return _currencySymbol;
}
