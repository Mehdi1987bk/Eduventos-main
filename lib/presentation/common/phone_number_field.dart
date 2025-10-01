import 'package:flutter/material.dart';
import '../../screens/login/login_screen.dart';
import '../resourses/app_colors.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController? controller;
  final TextEditingController _cartController = TextEditingController();
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final String? labelText;
  final TextInputAction? textInputAction;
  final bool autofocus;

  PhoneNumberField(
      {Key? key,
      this.controller,
      this.validator,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.labelText,
      this.autofocus = false,
      this.textInputAction})
      : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
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
        margin: const EdgeInsets.only(left: 10, right: 20),
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(15.0),
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
              textInputAction: widget.textInputAction,
              maxLines: 1,
              autofocus: widget.autofocus,
              keyboardType: TextInputType.phone,
              focusNode: _focusNode,
              cursorColor: AppColors.appColor,
              style: TextStyle(color: AppColors.darkBlue, fontSize: 16),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15,   right: 10),
                suffixIconConstraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                border: InputBorder.none,
                labelStyle: TextStyle(
                  color: finKodNumberFocus || widget._cartController.text.trim().isEmpty
                      ? Colors.black54
                      : Colors.transparent,
                  fontSize: 18,
                ),
                hintText: widget.labelText,
                hintStyle: TextStyle(color: Colors.black54, fontSize: 16),

              )),
        ));
  }
}
