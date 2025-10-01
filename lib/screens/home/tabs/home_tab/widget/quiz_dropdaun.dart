import 'package:flutter/material.dart';
import '../../../../../../../../../generated/l10n.dart';
import '../../../../../../../../../presentation/resourses/app_colors.dart';
import '../../../../../data/network/response/type_option.dart';

class QuizSelector extends StatefulWidget {
  final List<TypeOption> branches;
  final ValueChanged<TypeOption?> onBranchSelected;
  final TypeOption? initialBranch;
  final String title;

  const QuizSelector({
    Key? key,
    required this.branches,
    required this.onBranchSelected,
    this.initialBranch,
    required this.title,
  }) : super(key: key);

  @override
  _QuizSelectorState createState() => _QuizSelectorState();
}

class _QuizSelectorState extends State<QuizSelector> {
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
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<TypeOption>(
          hint: Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: AppColors.gradient,
              ),
            ),
            child: Image.asset("asset/filtr_icon.png"),
          ),
          value: _selectedBranch,
          isDense: false,
          isExpanded: false,
          itemHeight: 50.0,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(30),
          icon: SizedBox.shrink(),
          selectedItemBuilder: (BuildContext context) => widget.branches.map((TypeOption branch) {
            return Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: AppColors.gradient,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "asset/filtr_icon.png",
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    _selectedBranch?.name ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            );
          }).toList(),
          items: widget.branches.map((TypeOption branch) {
            return DropdownMenuItem<TypeOption>(
              value: branch,
              child: Text(
                branch.name ?? "",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: (_selectedBranch == branch) ? AppColors.appColor : Colors.black87,
                ),
              ),
            );
          }).toList(),
          onChanged: (TypeOption? newValue) {
            setState(() {
              _selectedBranch = newValue;
            });
            widget.onBranchSelected(newValue);
          },
        ),
      ),
    );
  }
}
