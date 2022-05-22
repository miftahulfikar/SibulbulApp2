import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('verifikasi email anda'),
      ),
      body: Column(
        children: [
          const Text(
              'Kami telah mengirimkan email verifikasi. Silakan buka email anda'),
          const Text('Jika tidak menerima email verifikasi, klik di bawah ini'),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child: const Text('kirim verifikasi email'),
          ),
          const Text('Jika sudah membuka email verifikasi, klik di bawah ini'),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            child: const Text('Masuk ke aplikasi'),
          )
        ],
      ),
    );
  }
}
