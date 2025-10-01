import 'package:flutter/material.dart';

import '../../../../../../../../../generated/l10n.dart';
import '../../../../../../../../../presentation/resourses/app_colors.dart';
import '../../../../../data/network/response/type_option.dart';

class ReytingRegionSelector extends StatefulWidget {
  final List<TypeOption> branches;
  final ValueChanged<TypeOption?> onBranchSelected;
  final TypeOption? initialBranch;
  final String title;

  const ReytingRegionSelector({
    Key? key,
    required this.branches,
    required this.onBranchSelected,
    this.initialBranch,
    required this.title,
  }) : super(key: key);

  @override
  _ReytingRegionSelectorState createState() => _ReytingRegionSelectorState();
}

class _ReytingRegionSelectorState extends State<ReytingRegionSelector> {
  TypeOption? _selectedBranch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
        color: AppColors.appColor.withOpacity(0.2),
      ),
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<TypeOption>(
            hint: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                widget.initialBranch?.name ?? widget.title,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            value: _selectedBranch,
            icon: Icon(
              Icons.arrow_drop_down,
            ),
            isExpanded: true,
            itemHeight: 50.0,
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(30),
            items: widget.branches.map((TypeOption branch) {
              return DropdownMenuItem<TypeOption>(
                value: branch,
                child: Text(
                  branch.titleAz ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
