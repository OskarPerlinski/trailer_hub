import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordField extends HookWidget {
  const PasswordField({
    required this.hintText,
    this.obscureText = true,
    this.hasError = false,
    required this.controller,
    super.key,
  });

  final String hintText;

  final bool hasError;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isObscure = useState(obscureText);

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        error: hasError ? SizedBox.shrink() : null,
        suffixIcon: IconButton(
          onPressed: () => isObscure.value = !isObscure.value,
          icon: Icon(isObscure.value ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      obscureText: isObscure.value,
    );
  }
}
