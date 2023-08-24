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

void showLoaderDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
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

extension TextStyleX on TextStyle {
  /// A method to underline a text with a customizable [distance] between the text
  /// and underline. The [color], [thickness] and [style] can be set
  /// as the decorations of a [TextStyle].
  TextStyle underlined({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle style = TextDecorationStyle.solid,
  }) {
    return copyWith(
      shadows: [
        Shadow(
          color: this.color ?? Colors.black,
          offset: Offset(0, -distance),
        )
      ],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationThickness: thickness,
      decorationColor: color ?? this.color,
      decorationStyle: style,
    );
  }
}
