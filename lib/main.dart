import 'package:aviasoul_front/features/guards/auth_guard/auth_guard.dart';
import 'package:aviasoul_front/features/managers/shared_prefernces_manager.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: AuthGuard(),
      ),
    );
  }
}