import 'package:eduventure/screens/login/forgot_password/forgot_password_screen.dart';
import 'package:eduventure/screens/registration/registration_student/registration_student_step_one_screen.dart';
import 'package:flutter/material.dart';
import '../../data/network/request/login_request.dart';
import '../../domain/entities/patterns.dart';
import '../../generated/l10n.dart';
import '../../presentation/bloc/base_screen.dart';
import '../../presentation/bloc/error_dispatcher.dart';
import '../../presentation/common/password_field.dart';
import '../../presentation/common/phone_number_field.dart';
import '../../presentation/resourses/app_colors.dart';
import '../registration/registration_parrent/registration_parrent_screen.dart';
import '../splesh/navig_parrent/parrent_navigator.dart';
import 'login_bloc.dart';

bool cartNumberFocus = false;
bool finKodNumberFocus = false;
const dialCodes = ['55', '70', '77', '50', '51', '99', '10', '60'];

class LoginScreen extends BaseScreen {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginBlock>
    with ErrorDispatcher, TickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validate);
    _passwordController.addListener(_validate);
  }

  @override
  Widget body() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: AppColors.bgColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 65, right: 65),
              child: Image.asset("asset/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      S.of(context).xoGldiniz,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Text(
                      S.of(context).zhmtOlmasaIstifadiNmrVParolunuzuDaxilEdin,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            TextTitiles(text: S.of(context).laqNmr),
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
                    controller: _nameController,
                    labelText: "***-**-**",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextTitiles(text: S.of(context).ifr),
            PasswordField(
              labelText: "********",
              controller: _passwordController,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotPasswordScreen(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    S.of(context).parolunuzuUnutmusunuz,
                    style: TextStyle(
                      color: AppColors.appColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _valueNotifier,
              builder: (_, value, __) {
                return Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20, bottom: 5, left: 18, right: 18),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: value ? AppColors.gradient : [Colors.grey, Colors.grey],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: value ? _login : null, // Если `false`, отключаем кнопку
                    child: Center(
                      child: Text(
                        S.of(context).daxilOl,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.18),
            GestureDetector(
              onTap: () {
                showCustomBottomSheet(context);
              },
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    S.of(context).hlHesabnzYoxdur + "  ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    S.of(context).qeydiyyatdanKein,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.appColor),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginBlock provideBloc() {
    return LoginBlock(num: _nameController.text.trim(), pass: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _valueNotifier.dispose();
    super.dispose();
  }

  void _validate() {
    var isValid = Patterns.textField.hasMatch(_nameController.text.trim()) &&
        Patterns.password.hasMatch(_passwordController.text.trim());

    if (_valueNotifier.value != isValid) {
      _valueNotifier.value = isValid; // UI обновится, так как ValueNotifier изменится
    }
  }

  _login() {
    final phone = "+994" + bloc.dialCode + _nameController.text.trim();
    final password = _passwordController.text.trim();
    bloc.login(LoginRequest(phone: phone, password: password)).then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ParrentNavigator(),
            ),
          ),
        );
  }
}

class TextTitiles extends StatelessWidget {
  final String text;

  const TextTitiles({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 5),
      child: Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }
}

class DropdownSelector extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final List<String> values;
  final String? initialValue; // <--- добавили

  const DropdownSelector({
    Key? key,
    required this.onChanged,
    required this.values,
    this.initialValue, // <--- добавили
  }) : super(key: key);

  @override
  _DropdownSelectorState createState() => _DropdownSelectorState();
}

class _DropdownSelectorState extends State<DropdownSelector> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? widget.values.first;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.only(left: 5),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            itemHeight: 50.0,
            value: selectedValue,
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(15),
            items: widget.values
                .map<DropdownMenuItem<String>>(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Text(
                        e,
                        style: TextStyle(color: Colors.black, fontSize: 16), // Цвет текста
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
                if (selectedValue != null) {
                  widget.onChanged(selectedValue!);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Spacer(),
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 30),
            Text(
              S.of(context).yeniHesabYaradn,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              S.of(context).valideynVYaAgirdKimiQeydiyyatdanKemkIstyirsinizSeiminiziEdin,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return RegistrationStudentStepOneScreen(isParent: '0',);
                }),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appColor,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                S.of(context).agirdKimiQeydiyyatKe,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return RegistrationParrentScreen();
                }),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.appColor),
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                S.of(context).valideynKimiQeydiyyatKe,
                style: TextStyle(
                  color: AppColors.appColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
