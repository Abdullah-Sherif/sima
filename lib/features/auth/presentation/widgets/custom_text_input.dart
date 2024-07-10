import 'package:flutter/material.dart';
import 'package:sima/core/extensions/context_extension.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    Key? key,
    this.leadingIcon,
    required this.controller,
    this.isPassword = false,
    this.hintText,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.focusNode,
  }) : super(key: key);

  final Icon? leadingIcon;
  final TextEditingController controller;
  final bool isPassword;
  final String? hintText;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final FocusNode? focusNode;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        height: 50,
        child: Form(
          child: TextFormField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            obscureText: !_isPasswordVisible,
            style: TextStyle(
              color: widget.textColor,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: widget.textColor?.withOpacity(0.5),
              ),
              prefixIcon: widget.leadingIcon,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: widget.textColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )
                  : null,
              fillColor: widget.backgroundColor,
              filled: widget.backgroundColor != null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
