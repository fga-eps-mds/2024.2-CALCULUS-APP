import 'package:flutter/material.dart';

class TextName extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final EdgeInsetsGeometry padding;
  final String initialText;

  const TextName(
      {super.key,
      this.label = 'Nome',
      required this.controller,
      required this.padding,
      this.initialText = ''});

  @override
  Widget build(BuildContext context) {

    controller.text = initialText;


    return Padding(
      padding: padding,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label Obrigatório.';
          } else if (value.trim().length < 2) {
            return 'Opa, seu $label está pequeno!\nacrescente mais caracteres. (Ex: Ana)';
          } else if (value.trim().length < 3) {
            return 'Opa, seu $label está pequeno!\nacrescente mais um caractere. (Ex: Ana)';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person_outline,
                color: Theme.of(context).colorScheme.primary),
            labelText: label),
      ),
    );
  }
}
