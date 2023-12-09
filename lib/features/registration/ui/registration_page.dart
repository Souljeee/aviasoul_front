import 'package:aviasoul_front/common/widgets/custom_elevated_button.dart';
import 'package:aviasoul_front/common/widgets/custom_text_field.dart';
import 'package:aviasoul_front/features/registration/bloc/registration_bloc.dart';
import 'package:aviasoul_front/features/registration/data/registration_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FormControl<String> _firstNameController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<String> _lastNameController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<String> _dtBirthController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<String> _emailController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<String> _passportDetailsController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<String> _passwordController = FormControl(
    validators: [Validators.required],
  );

  late final registrationForm = FormGroup({
    'first_name': _firstNameController,
    'last_name': _lastNameController,
    'dt_birth_name': _dtBirthController,
    'email_name': _emailController,
    'passport_details_name': _passportDetailsController,
    'password_name': _passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => RegistrationBloc(
            registrationRepository: RegistrationRepository(),
          ),
          child: BlocConsumer<RegistrationBloc, RegistrationState>(
            listener: (context, state) {
              state.mapOrNull(
                success: (state) {
                  if (state.allowAccess) {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Пользователь успешно создан'),
                      ),
                    );

                    return;
                  }
                },
              );
            },
            builder: (context, state) {
              return ReactiveForm(
                formGroup: registrationForm,
                child: Column(
                  children: [
                    const Spacer(),
                    const Center(
                      child: Text(
                        'Регистрация',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: 500,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _firstNameController,
                              label: 'Имя',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomTextField(
                              controller: _lastNameController,
                              label: 'Фамилия',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 500,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _dtBirthController,
                              label: 'Дата рождения',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomTextField(
                              controller: _emailController,
                              label: 'Адрес электронной почты',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 500,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _passportDetailsController,
                              label: 'Серия и номер паспорта',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomTextField(
                              controller: _passwordController,
                              label: 'Пароль',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ReactiveFormConsumer(
                      builder: (context, form, child) {
                        return SizedBox(
                          width: 300,
                          child: CustomElevatedButton(
                            onTap: form.valid
                                ? () {
                                    BlocProvider.of<RegistrationBloc>(context)
                                        .add(RegistrationEvent.createUser(
                                      firstName: _firstNameController.value!,
                                      lastName: _lastNameController.value!,
                                      dtBirth: _dtBirthController.value!,
                                      passportDetails: _passportDetailsController.value!,
                                      email: _emailController.value!,
                                      password: _passwordController.value!,
                                    ));
                                  }
                                : null,
                            text: 'Создать',
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
