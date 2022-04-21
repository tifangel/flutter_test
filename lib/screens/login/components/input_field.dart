import 'package:flutter/material.dart';
import 'package:myflutterapp/utility/constants.dart';

class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.typeInput,
      required this.typeAction,
      required this.isError,
      required this.onChanged})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String typeInput;
  final String typeAction;
  final bool isError;
  final ValueChanged<String> onChanged;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
            color:
                widget.isError ? Colors.red : secondaryColor.withOpacity(0.32)),
      ),
      child: TextField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            suffixIcon: widget.typeInput == 'password'
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: isPasswordVisible
                        ? const Icon(
                            Icons.visibility_off,
                            color: accentColor,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: accentColor,
                          ))
                : Container(width: 0)),
        keyboardType: widget.typeInput == 'email'
            ? TextInputType.emailAddress
            : widget.typeInput == 'password'
                ? TextInputType.visiblePassword
                : TextInputType.text,
        textInputAction: widget.typeAction == 'done'
            ? TextInputAction.done
            : TextInputAction.next,
        obscureText: !isPasswordVisible && widget.typeInput == 'password',
      ),
    );
  }
}
