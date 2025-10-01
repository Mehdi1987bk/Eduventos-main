import 'package:flutter/material.dart';
import '../../screens/login/login_screen.dart';
import '../resourses/app_colors.dart';

class HomePostFild extends StatefulWidget {
  final TextEditingController? controller;
  final TextEditingController _cartController = TextEditingController();
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final String? labelText;
  final TextInputAction? textInputAction;
  final Widget? icon;

  HomePostFild({
    Key? key,
    this.controller,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.labelText,
    this.icon,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<HomePostFild> createState() => _HomePostFildState();
}

class _HomePostFildState extends State<HomePostFild> {
  bool isHidden = true;
  final _focusNode = FocusNode();

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

      padding: EdgeInsets.only( left: 10, right: 10),
      margin: const EdgeInsets.only(left: 20, right: 20,top: 20,bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey, width: 1),
      ),
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
          focusNode: _focusNode,
          cursorColor: AppColors.appColor,
          style: TextStyle(color: AppColors.darkBlue, fontSize: 20),
          minLines: 1, // Минимальное количество строк
          maxLines: null, // Позволяет полю расширяться по мере ввода текста
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIconConstraints: BoxConstraints(maxHeight: 100, maxWidth: 50),
            labelStyle: TextStyle(
              color: finKodNumberFocus || widget._cartController.text.trim().isEmpty
                  ? Colors.black54
                  : Colors.transparent,
              fontSize: 18,
            ),
            suffixIcon: widget.icon != null ? widget.icon : null,
            labelText: widget.labelText,
          ),
        ),
      ),
    );
  }
}
