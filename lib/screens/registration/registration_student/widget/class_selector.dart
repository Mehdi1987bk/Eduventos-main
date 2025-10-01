import 'package:flutter/material.dart';

import '../../../../../../../../../generated/l10n.dart';
import '../../../../../../../../../presentation/resourses/app_colors.dart';
import '../../../../data/network/response/type_option.dart';
class ClassSelector extends StatefulWidget {
  final List<TypeOption> branches;
  final ValueChanged<TypeOption?> onBranchSelected;
  final TypeOption? initialBranch;
  final String title;
  final bool isEnabled; // ⬅️ добавим флаг для блокировки

  const ClassSelector({
    Key? key,
    required this.branches,
    required this.onBranchSelected,
    this.initialBranch,
    required this.title,
    this.isEnabled = true, // ⬅️ по умолчанию включен
  }) : super(key: key);

  @override
  _ClassSelectorState createState() => _ClassSelectorState();
}

class _ClassSelectorState extends State<ClassSelector> {
  TypeOption? _selectedBranch;

  @override
  void initState() {
    super.initState();
    if (widget.branches.contains(widget.initialBranch)) {
      _selectedBranch = widget.initialBranch;
    } else {
      _selectedBranch = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.isEnabled;

    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
        color:isEnabled == true ?  Colors.white : Colors.grey.withOpacity(0.3),
      ),
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<TypeOption>(
            hint: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                widget.initialBranch?.name ?? widget.title,
                style: TextStyle(
                  color: isEnabled ? Colors.black45 : Colors.grey, // серый, если выключено
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            value: _selectedBranch,
            icon: Icon(
              Icons.arrow_drop_down,
              color: isEnabled ? Colors.black : Colors.grey, // серый, если выключено
            ),
            isExpanded: true,
            itemHeight: 50.0,
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(30),
            items: widget.branches.map((TypeOption branch) {
              return DropdownMenuItem<TypeOption>(
                value: branch,
                child: Text(
                  branch.title ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              );
            }).toList(),
            onChanged: isEnabled
                ? (TypeOption? newValue) {
              setState(() {
                _selectedBranch = newValue;
              });
              widget.onBranchSelected(newValue);
            }
                : null, // ⬅️ отключено
          ),
        ),
      ),
    );
  }
}
