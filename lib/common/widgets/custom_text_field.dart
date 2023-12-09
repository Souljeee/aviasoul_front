import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef CustomTextFieldCallback<T> = void Function(FormControl<T> control);

class CustomTextField<T> extends StatelessWidget {
  final FormControl<T> controller;
  final String label;
  final CustomTextFieldCallback<T>? onTap;
  final CustomTextFieldCallback<T>? onChanged;

  const CustomTextField({
    required this.controller,
    required this.label,
    this.onTap,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      onChanged: onChanged,
      onTap: onTap,
      validationMessages: {
        ValidationMessage.required: (_) => 'Обязательное поле'
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        label: Text(label),
      ),
      formControl: controller,
    );
  }
}
