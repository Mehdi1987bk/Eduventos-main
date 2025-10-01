import 'package:eduventure/screens/registration/registration_student/registration_student_step_two_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entities/patterns.dart';
import '../../../generated/l10n.dart';
import '../../../presentation/bloc/base_screen.dart';
import '../../../presentation/bloc/error_dispatcher.dart';
import '../../../presentation/common/input_text.dart';
import '../../../presentation/common/phone_number_field.dart';
import '../../../presentation/resourses/app_colors.dart';
import '../../home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import '../../login/login_screen.dart';
import 'registration_student_bloc.dart';

class RegistrationStudentStepOneScreen extends BaseScreen {
  final String isParent;

  RegistrationStudentStepOneScreen({required this.isParent});

  @override
  State<RegistrationStudentStepOneScreen> createState() => _RegistrationStudentStepOneScreenState();
}

class _RegistrationStudentStepOneScreenState
    extends BaseState<RegistrationStudentStepOneScreen, RegistrationStudentBloc>
    with ErrorDispatcher {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _sernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validate);
    _phoneController.addListener(_validate);
    _sernameController.addListener(_validate);
    _fatherController.addListener(_validate);
  }

  @override
  Widget body() {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: CategoryNavigatorPop(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Text(
                S.of(context).agirdKimiQeydiyyatdanKe,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldNamed(
              labelText: S.of(context).ad,
              left: 20,
              bottom: 5,
              top: 0,
              isStar: true,
            ),
            TextFildd(
              labelText: S.of(context).ad,
              controller: _nameController,
            ),
            TextFieldNamed(
              labelText: "Soyad",
              left: 20,
              bottom: 5,
              top: 20,
              isStar: true,
            ),
            TextFildd(
              labelText: S.of(context).soyad,
              controller: _sernameController,
            ),
            TextFieldNamed(
              labelText: S.of(context).ataAd,
              left: 20,
              bottom: 5,
              top: 20,
              isStar: true,
            ),
            TextFildd(
              labelText: S.of(context).ataAd,
              controller: _fatherController,
            ),
            TextFieldNamed(
              labelText: S.of(context).mobilNmr,
              left: 20,
              bottom: 5,
              top: 20,
              isStar: true,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 55,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.withOpacity(0.3))),
                  child: DropdownSelector(
                    values: dialCodes,
                    onChanged: (String value) {
                      bloc.dialCode = value;
                    },
                  ),
                ),
                Expanded(
                  child: PhoneNumberField(
                    controller: _phoneController,
                    labelText: "***-**-**",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, bottom: 60, left: 18, right: 18),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: ValueListenableBuilder<bool>(
                valueListenable: _valueNotifier,
                builder: (_, value, __) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: AppColors.appColor.withOpacity(0.3),
                        padding: EdgeInsets.only(bottom: 15, top: 15),
                        backgroundColor: AppColors.appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: value ? _stepFree : null,
                    child: Text(
                      S.of(context).nvbti,
                      style: TextStyle(
                          color: value ? Colors.white : Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    print("object");
    if (!await launch("$url")) {
      throw 'Could not launch';
    }
  }

  @override
  RegistrationStudentBloc provideBloc() {
    return RegistrationStudentBloc();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _sernameController.dispose();
    super.dispose();
  }

  void _validate() {
    var isValid = Patterns.textField.hasMatch(_nameController.text.trim()) &&
        Patterns.textField.hasMatch(_phoneController.text.trim()) &&
        Patterns.textField.hasMatch(_fatherController.text.trim()) &&
        Patterns.textField.hasMatch(_sernameController.text.trim());
    _valueNotifier.value = isValid;
  }

  _stepFree() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final sername = _sernameController.text.trim();
    final father = _fatherController.text.trim();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RegistrationStudentStepTwoScreen(
          name: name,
          phone: "+994" + bloc.dialCode + phone,
          sername: sername,
          fatherName: father,
          isParent: widget.isParent,
        ),
      ),
    );
  }
}

class TextFieldNamed extends StatelessWidget {
  final String labelText;
  final double left;
  final double bottom;
  final double top;
  final bool? isStar;

  const TextFieldNamed({
    super.key,
    required this.labelText,
    required this.left,
    required this.bottom,
    required this.top,
    this.isStar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, bottom: bottom, top: top),
      child: Row(
        children: [
          Text(labelText, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          if (isStar == true)
            Text(" * ",
                style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.w700)),
          if (isStar == false)
            Text("   " + S.of(context).mcburiDeyil,
                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
