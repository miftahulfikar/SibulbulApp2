import 'package:flutter/material.dart';
import 'package:newproject/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Hapus',
    content: 'Anda yakin ingin menghapus catatan ini?',
    optionsBuilder: () => {
      'Batal': false,
      'Hapus': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
