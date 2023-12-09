import 'package:aviasoul_front/features/auth/ui/auth_page.dart';
import 'package:aviasoul_front/features/guards/auth_guard/auth_guard_bloc/auth_guard_bloc.dart';
import 'package:aviasoul_front/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthGuardBloc()..add(const AuthGuardEvent.checkAuthState()),
      child: BlocBuilder<AuthGuardBloc, AuthGuardState>(
        builder: (context, state) {
          return state.map(
            auth: (_) => const HomePage(),
            notAuth: (_) => const AuthPage(),
            checking: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            checkError: (_) => const Center(
              child: Text('Произошла ошибка'),
            ),
          );
        },
      ),
    );
  }
}
