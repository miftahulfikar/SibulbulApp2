import 'package:flutter/material.dart';
import 'package:newproject/constants/routes.dart';
import 'package:newproject/services/auth/auth_exceptions.dart';
import 'package:newproject/services/auth/auth_service.dart';
import '../utilities/dialogs/error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: ' Ketik email anda disini',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: ' Buat password anda',
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await AuthService.firebase().createUser(
                  email: email,
                  password: password,
                );
                AuthService.firebase().sendEmailVerification();
                Navigator.of(context).pushNamed(verifyEmailRoute);
              } on WeakPasswordAuthException {
                showErrorDialog(
                  context,
                  'password lemah',
                );
              } on EmailAlreadyInUsedAuthException {
                showErrorDialog(
                  context,
                  'email sudah terdaftar',
                );
              } on InvalidEmailAuthException {
                showErrorDialog(
                  context,
                  'format email tidak benar',
                );
              } on GenericAuthException {
                showErrorDialog(
                  context,
                  'Gagal mendaftar',
                );
              }
            },
            child: const Text('DAFTAR'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            child: const Text('Sudah terdaftar? login/masuk disini!'),
          )
        ],
      ),
    );
  }
}
