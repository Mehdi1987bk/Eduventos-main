import 'dart:io';
import 'package:eduventure/data/network/response/user.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/student_edit/student_edit_bloc.dart';
import 'package:eduventure/screens/registration/registration_student/widget/class_selector.dart';
import 'package:eduventure/screens/registration/registration_student/widget/group_selector.dart';
import 'package:eduventure/screens/registration/registration_student/widget/language_selecter.dart';
import 'package:eduventure/screens/registration/registration_student/widget/region_selector.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../data/network/response/type_option.dart';
import '../../../../../../domain/entities/patterns.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/bloc/base_screen.dart';
import '../../../../../../presentation/bloc/error_dispatcher.dart';
import '../../../../../../presentation/common/image_selector.dart';
import '../../../../../../presentation/common/input_text.dart';
import '../../../../../../presentation/common/password_field.dart';
import '../../../../../../presentation/common/phone_number_field.dart';
import '../../../../../../presentation/resourses/app_colors.dart';
import '../../../../../login/login_screen.dart';
import '../../../../../registration/widget/user_avatar.dart';
import '../../order/widget/category_navigator_pop.dart';
import '../forgot_password/forgot_password_screen.dart';

class StudentEditScreen extends BaseScreen {
  final User user;

  StudentEditScreen({
    required this.user,
  });

  @override
  State<StudentEditScreen> createState() => _StudentEditScreenState();
}

class _StudentEditScreenState extends BaseState<StudentEditScreen, StudentEditBloc>
    with ErrorDispatcher {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  late final TextEditingController _nameController = TextEditingController(text: widget.user.name);
  late final TextEditingController _phoneController =
      TextEditingController(text: widget.user.phone.substring(6));
  late final TextEditingController _fatherController =
      TextEditingController(text: widget.user.father);
  final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _sernameController =
      TextEditingController(text: widget.user.surname);

  TypeOption? language;
  TypeOption? clas;
  TypeOption? regions;
  TypeOption? group;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validate);
    _phoneController.addListener(_validate);
    _sernameController.addListener(_validate);
    _fatherController.addListener(_validate);
    _passwordController.addListener(_validate);
    bloc.dialCode = widget.user.phone.substring(4, 6);
    clas = TypeOption(
        id: widget.user.studentClass?.id ?? 0, name: "", title: widget.user.studentClass?.title);
    regions = TypeOption(id: widget.user.regionId ?? 0, name: "", title: "");
    group = TypeOption(id: widget.user.groupId ?? 0, name: "", title: "");
    language = TypeOption(id: widget.user.langId ?? 0, name: "", title: "");
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
              child: CategoryNavigatorPop(
                title: S.of(context).xsiMlumatlar,
              ),
            ),
            Center(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: GestureDetector(
                    onTap: () {
                      _selectImage();
                    },
                    child: StreamBuilder<File>(
                      stream: bloc.userAvatar,
                      builder: (context, snapshot) {
                        return Stack(
                          children: [
                            UserAvatar(
                              file: snapshot.data,
                              imgUrl: bloc.imageUrl,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 27,
                                height: 27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.appColor,
                                ),
                                margin: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 17,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Text(S.of(context).ad + "  ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            TextFildd(
              labelText: S.of(context).ad + " ",
              controller: _nameController,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
              child: Text(S.of(context).soyad,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            TextFildd(
              labelText: S.of(context).soyad,
              controller: _sernameController,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
              child: Text(S.of(context).ataAd,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            TextFildd(
              labelText: S.of(context).ataAd,
              controller: _fatherController,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
              child: Text(S.of(context).mobilNmr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
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
                    initialValue: widget.user.phone.substring(4, 6),
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
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
              child: Text(S.of(context).dil,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            FutureBuilder(
              future: bloc.getLanguages,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  final initialValue =
                      snapshot.requireData.where((e) => e.id == widget.user.langId).first;
                  return LanguageSelector(
                    initialBranch: initialValue,
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
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 0),
              child: Text(S.of(context).region,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            FutureBuilder(
              future: bloc.getRegions,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  final initialValue = snapshot.requireData.where((e) {
                    return e.id == widget.user.regionId;
                  }).first;
                  print("initialValueRegion" + initialValue.titleAz.toString());
                  return RegionSelector(
                    initialBranch: initialValue,
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
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 0),
              child: Text(S.of(context).sinif,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            FutureBuilder(
              future: bloc.getClasses,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return ClassSelector(
                    initialBranch:
                        snapshot.requireData.where((e) => e.id == widget.user.studentClassId).first,
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
                    isEnabled: false,
                  );
                }
                return SizedBox();
              },
            ),
            if (clas?.title == "9" || clas?.title == "10" || clas?.title == "11")
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5, top: 0),
                child: Text(S.of(context).qrup,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
            if (clas?.title == "9" || clas?.title == "10" || clas?.title == "11")
              FutureBuilder(
                future: bloc.getGroups,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return GroupSelector(
                      initialBranch:
                          snapshot.requireData.list.where((e) => e.id == widget.user.groupId).first,
                      branches: snapshot.requireData.list,
                      onBranchSelected: (TypeOption? selectedBranch) {
                        if (selectedBranch != null) {
                          regions = selectedBranch;
                          _validate();
                        }
                      },
                      title: S.of(context).qrupSein,
                      isEnabled: false,
                    );
                  }
                  return SizedBox();
                },
              ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 0),
              child: Text(S.of(context).ifr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            PasswordField(
              labelText: "********",
              controller: _passwordController,
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
                      S.of(context).yaddaSaxla,
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
  StudentEditBloc provideBloc() {
    return StudentEditBloc(widget.user);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _sernameController.dispose();
    super.dispose();
  }

  Future<void> _selectImage() async {
    final source = await showSelectImageSourceAlert(context);
    if (source != null) {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        await bloc.onImageSelected(File(image.path)).then((value) {
          bloc.getUserDetails();
          showSuccess(S.of(context).mlumatYenilndi, context);
        });
      }
    }
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
    final password = _passwordController.text.trim();
    final sername = _sernameController.text.trim();
    final father = _fatherController.text.trim();

    bloc
        .updateUserData(
      name: name,
      phone: "+994" + bloc.dialCode + phone,
      password: password,
      sername: sername,
      father: father,
      langId: language?.id.toString() ?? "",
      regionId: regions?.id.toString() ?? "",
      groupId: group?.id.toString() ?? "",
      studentClassId: clas?.id.toString() ?? "",
    )
        .then((value) {
      bloc.getUserDetails();
      Navigator.pop(context);
      showSuccess(S.of(context).mlumatYenilndi, context);
    });
  }
}
