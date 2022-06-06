import 'package:flutter/material.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({Key? key}) : super(key: key);

  @override
  State<NewNoteView> createState() => _NewNoteView();
}

class _NewNoteView extends State<NewNoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Baru'),
      ),
      body: const Text('Tulis catatan baru anda disini..'),
    );
  }
}
