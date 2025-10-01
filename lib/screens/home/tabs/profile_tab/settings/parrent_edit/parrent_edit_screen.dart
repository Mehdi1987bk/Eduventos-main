import 'dart:io';

import 'package:eduventure/data/network/response/user.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:eduventure/screens/registration/registration_parrent/widget/otp_registration_parrent.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

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
import '../forgot_password/forgot_password_screen.dart';
import 'parrent_edit_bloc.dart';

class ParrentEditScreen extends BaseScreen {
  final User user;

  ParrentEditScreen({
    super.key,
    required this.user,
  });

  @override
  State<ParrentEditScreen> createState() => _ParrentEditScreenState();
}

class _ParrentEditScreenState extends BaseState<ParrentEditScreen, ParrentEditBloc>
    with ErrorDispatcher {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  late final TextEditingController _nameController = TextEditingController(text: widget.user.name);
  late final TextEditingController _phoneController =
      TextEditingController(text: widget.user.phone.substring(6));
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _sernameController =
      TextEditingController(text: widget.user.surname);

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validate);
    _phoneController.addListener(_validate);
    _sernameController.addListener(_validate);
    _passwordController.addListener(_validate);
    bloc.dialCode = widget.user.phone.substring(4, 6);
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
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Text(S.of(context).ad+"  ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            TextFildd(
              labelText: S.of(context).qeydEt,
              controller: _nameController,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
              child: Text(S.of(context).soyad, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            TextFildd(
              labelText: S.of(context).qeydEt,
              controller: _sernameController,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
              child: Text(S.of(context).telefonNmrsi,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
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
              child: Text(S.of(context).ifr, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            PasswordField(
              labelText: "********",
              controller: _passwordController,
            ),
            SizedBox(
              height: 10,
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
                        S.of(context).yaddaSaxla,
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

  @override
  ParrentEditBloc provideBloc() {
    return ParrentEditBloc(widget.user);
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
        Patterns.textField.hasMatch(_sernameController.text.trim());
    _valueNotifier.value = isValid;
  }

  _stepFree() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    final sername = _sernameController.text.trim();
    print(bloc.dialCode + phone);

    bloc
        .updateUserData(
      name: name,
      phone: "+994" + bloc.dialCode + phone,
      password: password,
      sername: sername,
    )
        .then((value) {
      bloc.getUserDetails();
      Navigator.pop(context);
      showSuccess(S.of(context).mlumatYenilndi, context);
    });
  }
}
