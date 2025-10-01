import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinInputField extends StatefulWidget {
  final int codeLength;
  final void Function(String code)? onCodeChanged;

  const PinInputField({
    Key? key,
    this.codeLength = 4,
    this.onCodeChanged,
  }) : super(key: key);

  @override
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  String _currentCode = "";

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.codeLength, (_) => TextEditingController());
    _focusNodes = List.generate(widget.codeLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    _currentCode = _controllers.map((controller) => controller.text).join();
    widget.onCodeChanged?.call(_currentCode);

    if (_currentCode.length == widget.codeLength) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.codeLength,
            (index) => _buildPinBox(index),
      ),
    );
  }

  Widget _buildPinBox(int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 6,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.9,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
            if (_controllers[index].text.isEmpty && index > 0) {
               _controllers[index - 1].clear();
              _focusNodes[index - 1].requestFocus();
              _onTextChanged();
            }
          }
        },
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          maxLength: 1,
          autofocus: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              // Перемещение фокуса вперёд
              if (index < widget.codeLength - 1) {
                _focusNodes[index + 1].requestFocus();
              }
            } else if (value.isEmpty && index > 0) {
              // Перемещение фокуса назад
              _focusNodes[index - 1].requestFocus();
            }
            _onTextChanged();
          },
        ),
      ),
    );
  }
}
