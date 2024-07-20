import 'package:flutter/material.dart';

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
    this.borderRadius = 6,
    this.width = 350,
    this.errorMessage,
    this.onChanged,
    this.onEditingComplete,
  }) : super(key: key);

  final Icon? leadingIcon;
  final TextEditingController controller;
  final bool isPassword;
  final String? hintText;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final FocusNode? focusNode;
  final double borderRadius;
  final double width;
  final String? errorMessage;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;

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
        width: widget.width,
        child: Column(
          children: [
            Form(
              child: TextFormField(
                focusNode: widget.focusNode,
                controller: widget.controller,
                obscureText: !_isPasswordVisible,
                style: TextStyle(
                  color: widget.textColor,
                ),
                onChanged: widget.onChanged,
                onEditingComplete: widget.onEditingComplete,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                      color: widget.borderColor ?? Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                      color: widget.borderColor ?? Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            if (widget.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  widget.errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
