import 'package:eduventure/screens/registration/registration_student/registration_student_step_one_screen.dart';
import 'package:eduventure/screens/registration/registration_student/widget/class_selector.dart';
import 'package:eduventure/screens/registration/registration_student/widget/group_selector.dart';
import 'package:eduventure/screens/registration/registration_student/widget/language_selecter.dart';
import 'package:eduventure/screens/registration/registration_student/widget/otp_registration_student.dart';
import 'package:eduventure/screens/registration/registration_student/widget/region_selector.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/network/response/send_otp_reqister.dart';
import '../../../data/network/response/type_option.dart';
import '../../../domain/entities/patterns.dart';
import '../../../generated/l10n.dart';
import '../../../presentation/bloc/base_screen.dart';
import '../../../presentation/bloc/error_dispatcher.dart';
import '../../../presentation/common/input_text.dart';
import '../../../presentation/common/password_field.dart';
import '../../../presentation/resourses/app_colors.dart';
import '../../home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import '../registration_parrent/registration_parrent_screen.dart';
import 'registration_student_bloc.dart';

class RegistrationStudentStepTwoScreen extends BaseScreen {
  final String isParent;
  final String name;
  final String phone;
  final String sername;
  final String fatherName;

  RegistrationStudentStepTwoScreen({
    required this.isParent,
    required this.name,
    required this.phone,
    required this.sername,
    required this.fatherName,
  });

  @override
  State<RegistrationStudentStepTwoScreen> createState() => _RegistrationStudentStepTwoScreenState();
}

class _RegistrationStudentStepTwoScreenState
    extends BaseState<RegistrationStudentStepTwoScreen, RegistrationStudentBloc>
    with ErrorDispatcher {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _promoController = TextEditingController();
  bool isTermsAccepted = false;
  bool isAdsAccepted = false;
  bool isParrentAccepted = false;
  bool isNotificationsAccepted = false;

  TypeOption? language;
  TypeOption? clas;
  TypeOption? regions;
  TypeOption? group;

  @override
  void initState() {
    super.initState();
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
              labelText: S.of(context).dil,
              left: 20,
              bottom: 5,
              top: 20,
              isStar: true,
            ),
            FutureBuilder(
              future: bloc.getLanguages,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return LanguageSelector(
                    branches: snapshot.requireData,
                    onBranchSelected: (TypeOption? selectedBranch) {
                      if (selectedBranch != null) {
                        setState(() {
                          language = selectedBranch;
                        });
                        _validate();
                      }
                    },
                    title: S.of(context).dilSein,
                  );
                }
                return SizedBox();
              },
            ),
            TextFieldNamed(
              labelText: S.of(context).region,
              left: 20,
              bottom: 5,
              top: 0,
              isStar: true,
            ),
            FutureBuilder(
              future: bloc.getRegions,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return RegionSelector(
                    branches: snapshot.requireData,
                    onBranchSelected: (TypeOption? selectedBranch) {
                      if (selectedBranch != null) {
                        regions = selectedBranch;
                        _validate();
                      }
                    },
                    title: S.of(context).regionSein,
                  );
                }
                return SizedBox();
              },
            ),
            TextFieldNamed(
              labelText: S.of(context).sinif,
              left: 20,
              bottom: 5,
              top: 0,
              isStar: true,
            ),
            FutureBuilder(
              future: bloc.getClasses,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return ClassSelector(
                    branches: snapshot.requireData,
                    onBranchSelected: (TypeOption? selectedBranch) {
                      if (selectedBranch != null) {
                        setState(() {
                          clas = selectedBranch;
                        });
                        _validate();
                      }
                    },
                    title: S.of(context).sinfiSein,
                  );
                }
                return SizedBox();
              },
            ),
            if (clas?.title == "9" || clas?.title == "10" || clas?.title == "11")
              TextFieldNamed(
                labelText: S.of(context).qrup,
                left: 20,
                bottom: 5,
                top: 0,
                isStar: true,
              ),
            if (clas?.title == "9" || clas?.title == "10" || clas?.title == "11")
              FutureBuilder(
                future: bloc.getGroups,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return GroupSelector(
                      branches: snapshot.requireData.list,
                      onBranchSelected: (TypeOption? selectedBranch) {
                        if (selectedBranch != null) {
                          group = selectedBranch;
                          _validate();
                        }
                      },
                      title: S.of(context).qrupSein,
                    );
                  }
                  return SizedBox();
                },
              ),
            TextFieldNamed(
              labelText: S.of(context).ifr,
              left: 20,
              bottom: 5,
              top: 0,
              isStar: true,
            ),
            PasswordField(
              labelText: "********",
              controller: _passwordController,
            ),
            TextFieldNamed(
              labelText: S.of(context).promokod,
              left: 20,
              bottom: 5,
              top: 20,
              isStar: false,
            ),
            TextFildd(
              labelText: S.of(context).qeydEt,
              controller: _promoController,
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
                          text: " " + S.of(context).v + " ",
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
                          text:" " + S.of(context).ilRazyam,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomCheckboxTile(
                  value: isParrentAccepted,
                  onChanged: (value) {
                    setState(() => isParrentAccepted = value);
                    _validate();
                  },
                  label: Text(
                    S.of(context).qeydiyyatValideynNzartiAltndaKeirm,
                    style: TextStyle(fontSize: 16),
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
                      S.of(context).qeydiyyatdanKe,
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
    _passwordController.dispose();
    super.dispose();
  }

  void _validate() {
    var isValid = Patterns.textField.hasMatch(_passwordController.text.trim()) &&
        isTermsAccepted &&
        isParrentAccepted &&
        clas != null &&
        regions != null &&
        language != null;
    _valueNotifier.value = isValid;
  }

  _stepFree() {
    final password = _passwordController.text.trim();

    bloc.sendOtpRegister(SendOtpReqister(phoneNumber: widget.phone, isParent: 0)).then(
      (value) {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => OtpStudentScreen(
              name: widget.name,
              password: password,
              phone: widget.phone,
              sername: widget.sername,
              fatherName: widget.fatherName,
              classId: clas ?? TypeOption(id: 1, name: "O'zbekcha"),
              regionId: regions ?? TypeOption(id: 1, name: "O'zbekcha"),
              languageId: language ?? TypeOption(id: 1, name: "O'zbekcha"),
              groupId: group ?? TypeOption(id: 1, name: "O'zbekcha"),
              isParent: widget.isParent,
              promoCode: _promoController.text.trim(),
            ),
          ),
        );
      },
    );
  }
}
