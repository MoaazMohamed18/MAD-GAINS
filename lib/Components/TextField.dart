import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? ontap;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLength;
  final bool isEmpty;

  const Field({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.ontap,
    this.onChanged,
    this.keyboardType,
    this.textAlign,
    this.maxLength,
    this.isEmpty = false,
  });

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign ?? TextAlign.start,
        maxLength: widget.maxLength,
        obscureText: widget.obscureText,
        onTap: widget.ontap,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.isEmpty ? Colors.red : Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.isEmpty ? Colors.red : Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.isEmpty ? Colors.red : Colors.grey),
          ),
          errorText: widget.isEmpty ? 'This field is required' : null,
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          counterText: '',
        ));
  }
}
