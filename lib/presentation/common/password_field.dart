import 'package:flutter/material.dart';

import 'animated_password_toggle.dart';
import '../../screens/login/login_screen.dart';
import '../resourses/app_colors.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final TextEditingController _cartController = TextEditingController();
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final String? labelText;
  final TextInputAction? textInputAction;

  PasswordField(
      {Key? key,
      this.controller,
      this.validator,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.labelText,
      this.textInputAction})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidden = true;
  var _focusNode = new FocusNode();

  _focusListener() {
    setState(() {});
  }

  @override
  void initState() {
    _focusNode.addListener(_focusListener);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(20.0),
          border: _focusNode.hasFocus
              ? Border.all(color: AppColors.appColor)
              : Border.all(color: Colors.grey.withOpacity(0.2))),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            finKodNumberFocus = hasFocus;
          });
        },
        child: TextFormField(
          autovalidateMode: widget.autovalidateMode,
          validator: widget.validator,
          controller: widget.controller,
          obscureText: isHidden,
          autofillHints: const [AutofillHints.password],
          textInputAction: widget.textInputAction,
          maxLines: 1,
          focusNode: _focusNode,
          cursorColor: AppColors.appColor,
          style: TextStyle(color: AppColors.darkBlue, fontSize: 20),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 0, left: 15, top: 0, right: 10),
            suffixIconConstraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
            border: InputBorder.none,
            labelStyle: TextStyle(
                color: finKodNumberFocus || widget._cartController.text.trim().isEmpty
                    ? Colors.black54
                    : Colors.transparent,
                fontSize: 18),
            hintText: widget.labelText,
            hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
            suffixIcon: AnimatedToggle(
              onChanged: _toggle,
            ),
          ),
        ),
      ),
    );
  }

  _toggle(bool isHidden) {
    setState(() {
      this.isHidden = isHidden;
    });
  }
}
