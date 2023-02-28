import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isSecure,
      obscuringCharacter: "*",
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: "Password",
        suffix: _onVisibilityIcon(),
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(onPressed:_changeLoading,
          icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off));
  }
}
