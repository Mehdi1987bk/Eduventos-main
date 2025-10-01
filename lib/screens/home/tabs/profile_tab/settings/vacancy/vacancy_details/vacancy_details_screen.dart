import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/vacancy/vacancy_details/vacancy_details_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../../data/network/response/vacancy.dart';
import '../../../../../../../domain/entities/patterns.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../presentation/bloc/error_dispatcher.dart';
import '../../../../../../../presentation/common/input_text.dart';
import '../../../../../../../presentation/common/phone_number_field.dart';
import '../../../../../../../presentation/resourses/app_colors.dart';
import '../../../../../../login/login_screen.dart';
import '../../../../../../registration/registration_parrent/registration_parrent_screen.dart';
import '../../../../../home_screen.dart';
import '../../../../home_tab/subjects/exam/questions/widget/html_math_parse.dart';
import '../../../../home_tab/widget/post_item.dart';
import '../../../order/widget/category_navigator_pop.dart';

class VacancyDetailsScreen extends BaseScreen {
  final Vacancy vacancy;

  VacancyDetailsScreen({
    super.key,
    required this.vacancy,
  });

  @override
  State<VacancyDetailsScreen> createState() => _VacancyDetailsScreenState();
}

class _VacancyDetailsScreenState extends BaseState<VacancyDetailsScreen, VacancyDetailsBloc>
    with ErrorDispatcher {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isNotificationsAccepted = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validate);
    _phoneController.addListener(_validate);
    _surnameController.addListener(_validate);
    _emailController.addListener(_validate);
  }

  @override
  Widget body() {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: CategoryNavigatorPop(
              title: widget.vacancy.titleAz,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: 10),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(20),
                  //       child: Image(
                  //         height: 200,
                  //         width: MediaQuery.of(context).size.width - 40,
                  //         fit: BoxFit.cover,
                  //         image: CachedNetworkImageProvider(
                  //           post.image ?? "https://e-deal.az/postImage/default.jpg",
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.5 - 40,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.appColor.withOpacity(0.2),
                          ),
                          child: Center(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "asset/date_ic.png",
                                width: 17,
                                color: AppColors.appColor,
                              ),
                              Text(
                                "  " + formatDay(widget.vacancy.createdAt ?? DateTime.now()),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: AppColors.appColor),
                              ),
                            ],
                          )),
                        ),
                        Spacer(),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.5 - 40,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.appColor.withOpacity(0.2),
                          ),
                          child: Center(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "asset/eye.png",
                                width: 17,
                                color: AppColors.appColor,
                              ),
                              Text(
                                "  " +
                                    widget.vacancy.readCount.toString() +
                                    " " +
                                    S.of(context).bax,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: AppColors.appColor),
                              ),
                            ],
                          )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 3, left: 10),
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      widget.vacancy.titleAz ?? "null",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FormulaHtmlWidget(
                      html: widget.vacancy.contentAz ?? "",
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(S.of(context).mracitEt,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => pickFile(true),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: bloc.fileName == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "asset/file_downlide.png",
                                    width: 32,
                                    color: AppColors.textColor,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    S.of(context).cvYkl,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.check_circle, size: 32, color: Colors.green),
                                  const SizedBox(width: 8),
                                  Text(
                                    bloc.fileName!,
                                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      S.of(context).dyimkNKliklVYaDragdropEt,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 5),
                    child: Text(S.of(context).ad + "  ",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  TextFildd(
                    labelText: S.of(context).qeydEt,
                    controller: _nameController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
                    child: Text(S.of(context).soyad + "  ",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  TextFildd(
                    labelText: S.of(context).qeydEt,
                    controller: _surnameController,
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
                    child: Text(S.of(context).email + "  ",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  TextFildd(
                    labelText: S.of(context).qeydEt,
                    controller: _emailController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
                    child: Text(S.of(context).motivasiyaMktubu + "  ",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _descriptionController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: S.of(context).motivasiyaMktubuQeydEdin,
                        hintStyle: TextStyle(color: Color(0xFF6A5D84)),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  CustomCheckboxTile(
                    value: isNotificationsAccepted,
                    onChanged: (value) {
                      setState(() => isNotificationsAccepted = value);
                      // _validate();
                    },
                    label: Text(
                      S.of(context).buNmryGlckReklamlarQbulEdirm,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  if (isNotificationsAccepted == true)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => pickFile(false),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: bloc.motionName == null
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "asset/file_downlide.png",
                                          width: 32,
                                          color: AppColors.textColor,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          S.of(context).sertifikatLavEt,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.check_circle,
                                            size: 32, color: Colors.green),
                                        const SizedBox(width: 8),
                                        Text(
                                          bloc.motionName!,
                                          style:
                                              const TextStyle(fontSize: 14, color: Colors.black87),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Text(
                            S.of(context).dyimkNKliklVYaDragdropEt,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
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
                        margin: EdgeInsets.only(top: 30, bottom: 30, left: 18, right: 18),
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
                          onTap: value ? _sendVacancy : null,
                          child: Center(
                            child: Text(
                              S.of(context).mracitEt,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  VacancyDetailsBloc provideBloc() {
    return VacancyDetailsBloc();
  }

  Future<void> pickFile(bool isCv) async {
    if (await Permission.photos.request().isGranted ||
        await Permission.videos.request().isGranted ||
        await Permission.audio.request().isGranted ||
        await Permission.storage.request().isGranted) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          bloc.fileName = result.files.first.name;
          if (isCv == true) bloc.cvFile = File(result.files.first.path!);
          if (isCv != true) bloc.motifFile = File(result.files.first.path!);
          _validate();
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).cazVerilmdi),
        ),
      );
      openAppSettings();
    }
  }

  void _validate() {
    var isValid = Patterns.textField.hasMatch(_nameController.text.trim()) &&
        Patterns.textField.hasMatch(_phoneController.text.trim()) &&
        Patterns.textField.hasMatch(_surnameController.text.trim()) &&
        Patterns.textField.hasMatch(_emailController.text.trim()) &&
        bloc.cvFile != null;
    _valueNotifier.value = isValid;
  }

  _sendVacancy() {
    bloc
        .vacancyApply(
      vacancyId: widget.vacancy.id.toString(),
      email: _emailController.text.trim(),
      surname: _surnameController.text.trim(),
      phone: "+994" + bloc.dialCode + _phoneController.text.trim(),
      text: _descriptionController.text.trim(),
    )
        .then(
      (value) {
        if (mounted) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              icon: Icon(
                Icons.filter_none,
                color: Colors.green.withOpacity(0.0),
              ),
              message: S.of(context).qeydiyyatUurlaTamamland,
            ),
          );
          return Navigator.pop(context);
        }
      },
    );
  }
}
