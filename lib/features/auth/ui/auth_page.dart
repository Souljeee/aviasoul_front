import 'package:aviasoul_front/common/widgets/custom_elevated_button.dart';
import 'package:aviasoul_front/common/widgets/custom_text_field.dart';
import 'package:aviasoul_front/features/auth/bloc/auth_bloc.dart';
import 'package:aviasoul_front/features/auth/data/auth_repository.dart';
import 'package:aviasoul_front/features/home/home_page.dart';
import 'package:aviasoul_front/features/registration/ui/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final FormControl<String> emailController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<String> passwordController = FormControl(
    validators: [Validators.required],
  );

  late final FormGroup form = FormGroup({
    'email': emailController,
    'password': passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: AuthRepository(),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (_) {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomePage(),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Center(
                    child: Text(
                      'Aviasoul',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: CustomTextField(
                        controller: emailController,
                        label: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: CustomTextField(
                        controller: passwordController,
                        label: 'Пароль',
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ReactiveFormConsumer(builder: (context, form, child) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Center(
                        child: SizedBox(
                          width: 300,
                          child: CustomElevatedButton(
                            onTap: form.valid
                                ? () {
                                    BlocProvider.of<AuthBloc>(context).add(
                                      AuthEvent.authUser(
                                        email: emailController.value!,
                                        password: passwordController.value!,
                                      ),
                                    );
                                  }
                                : null,
                            text: 'Войти',
                          ),
                        ),
                      ),
                    );
                  }),
                  const Spacer(),
                  const Text('Нет аккаунта?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegistrationPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Зарегистрируйтесь!',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
