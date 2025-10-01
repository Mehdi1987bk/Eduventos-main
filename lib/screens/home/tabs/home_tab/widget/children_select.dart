import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../generated/l10n.dart';
import '../../../../../../../../../presentation/resourses/app_colors.dart';
import '../../../../../data/network/response/user.dart';
import '../../../../registration/registration_parrent/student_search/student_search_screen.dart';

class ChildrenSelector extends StatefulWidget {
  final List<User> branches;
  final ValueChanged<User?> onBranchSelected;
  final User? initialBranch;
  final String title;

  const ChildrenSelector({
    Key? key,
    required this.branches,
    required this.onBranchSelected,
    this.initialBranch,
    required this.title,
  }) : super(key: key);

  @override
  _ChildrenSelectorState createState() => _ChildrenSelectorState();
}

class _ChildrenSelectorState extends State<ChildrenSelector> {
  User? _selectedBranch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<User>(
            value: widget.branches.contains(_selectedBranch) ? _selectedBranch : null,
            hint: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(widget.initialBranch?.image ?? ""),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.initialBranch?.name ?? widget.title,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            icon: Icon(
              Icons.arrow_drop_down,
            ),
            isExpanded: true,
            itemHeight: 50.0,
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(30),
            items: [
              ...widget.branches.map((User branch) {
                return DropdownMenuItem<User>(
                  value: branch,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(branch.image ?? ""),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        branch.name ?? "",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              DropdownMenuItem<User>(
                // Не даём value
                // value: null, ❌

                enabled: false, // чтобы DropdownButton не думал, что это выбор
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => StudentSearchScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      S.of(context).lavEt,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.appColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            onChanged: (User? newValue) {
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
