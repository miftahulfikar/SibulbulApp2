import 'package:flutter/material.dart';
import 'package:newproject/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog<void>(
      context: context,
      title: 'Terjadi kesalahan',
      content: text,
      optionsBuilder: () => {
            'OK': null,
          });
}
