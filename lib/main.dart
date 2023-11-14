import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:varta_app/services/auth/auth_gate.dart';
import 'firebase_options.dart';
// import 'package:varta_app/pages/register_page.dart';
// import 'package:varta_app/services/auth/login_or_register.dart';
// import 'pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
