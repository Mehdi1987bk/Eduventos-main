import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:eduventure/screens/registration/registration_parrent/widget/otp_registration_parrent.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/network/response/send_otp_reqister.dart';
import '../../../domain/entities/patterns.dart';
import '../../../generated/l10n.dart';
import '../../../presentation/bloc/base_screen.dart';
import '../../../presentation/bloc/error_dispatcher.dart';
import '../../../presentation/common/input_text.dart';
import '../../../presentation/common/password_field.dart';
import '../../../presentation/common/phone_number_field.dart';
import '../../../presentation/resourses/app_colors.dart';
import '../../login/login_screen.dart';
import '../registration_student/registration_student_step_one_screen.dart';
import 'registration_parrent_bloc.dart';

class RegistrationParrentScreen extends BaseScreen {
  @override
  State<RegistrationParrentScreen> createState() => _RegistrationParrentScreenState();
}

class _RegistrationParrentScreenState
    extends BaseState<RegistrationParrentScreen, RegistrationParrentBloc> with ErrorDispatcher {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _sernameController = TextEditingController();
  bool isTermsAccepted = false;
  bool isAdsAccepted = false;
  bool isNotificationsAccepted = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validate);
    _phoneController.addListener(_validate);
    _sernameController.addListener(_validate);
    _passwordController.addListener(_validate);
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
                S.of(context).valideynKimiQeydiyyatdanKe,
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
              labelText: S.of(context).ad,
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
            TextFieldNamed(
              labelText: S.of(context).ifr,
              left: 20,
              bottom: 5,
              top: 20,
              isStar: true,
            ),
            PasswordField(
              labelText: "********",
              controller: _passwordController,
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCheckboxTile(
                  value: isTermsAccepted,
                  onChanged: (value) {
                    setState(() => isTermsAccepted = value);
                    _validate();
                  },
                  label: RichText(
                    text: TextSpan(
                       style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                          text: S.of(context).rtlrQaydalar,
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _launchURL("https://eduventos.az/terms-and-conditions");
                            },
                        ),
                        TextSpan(
                          text: " "+S.of(context).v +" ",
                          style: TextStyle(
                             decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: S.of(context).mxfilikSiyasti,
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _launchURL("https://eduventos.az/privacy-policy");
                            },
                        ),
                        TextSpan(
                          text: " "  + S.of(context).ilRazyam,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomCheckboxTile(
                  value: isAdsAccepted,
                  onChanged: (value) {
                    setState(() => isAdsAccepted = value);
                    _validate();
                  },
                  label: Text(
                    S.of(context).buNmryGlckReklamlarQbulEdirm,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                CustomCheckboxTile(
                  value: isNotificationsAccepted,
                  onChanged: (value) {
                    setState(() => isNotificationsAccepted = value);
                    _validate();
                  },
                  label: Text(
                    S.of(context).buNmryGlckDigrBildirilriQbulEdirm,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _valueNotifier,
              builder: (_, value, __) {
                return Container(
                  height: 55,
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
                    onTap: value ? _stepFree : null, // Если `false`, отключаем кнопку
                    child: Center(
                      child: Text(
                        S.of(context).qeydiyyatdanKein,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                );
              },
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
  RegistrationParrentBloc provideBloc() {
    return RegistrationParrentBloc();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _sernameController.dispose();
    super.dispose();
  }

  void _validate() {
    var isValid = Patterns.textField.hasMatch(_nameController.text.trim()) &&
        Patterns.textField.hasMatch(_phoneController.text.trim()) &&
        Patterns.textField.hasMatch(_sernameController.text.trim()) &&
        Patterns.textField.hasMatch(_passwordController.text.trim()) &&
        isTermsAccepted;
    _valueNotifier.value = isValid;
  }

  _stepFree() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    final sername = _sernameController.text.trim();

    bloc
        .sendOtpRegister(SendOtpReqister(phoneNumber: "+994" + bloc.dialCode + phone, isParent: 1))
        .then(
      (value) {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => OtpParrentScreen(
              name: name,
              password: password,
              phone: "+994" + bloc.dialCode + phone,
              sername: sername,
            ),
          ),
        );
      },
    );
  }
}

class CustomCheckboxTile extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final Widget label;

  CustomCheckboxTile({required this.value, required this.onChanged, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onChanged(!value),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5), // Делаем чекбокс с круглыми краями
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
                  color: value ? AppColors.appColor : Colors.transparent,
                ),
                child: value ? Icon(Icons.check, color: Colors.white, size: 18) : SizedBox.shrink(),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: label),
        ],
      ),
    );
  }
}
