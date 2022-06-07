import 'package:flutter/material.dart';
import 'package:newproject/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Keluar',
    content: 'Anda yakin ingin keluar',
    optionsBuilder: () => {
      'Batal': false,
      'Keluar': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
