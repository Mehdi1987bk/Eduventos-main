import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/registration/registration_parrent/student_search/student_search_bloc.dart';
import 'package:eduventure/screens/registration/registration_parrent/student_search/widget/success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/network/response/user.dart';
import '../../../../generated/l10n.dart';
import '../../../../presentation/resourses/app_colors.dart';
import '../../../home/tabs/profile_tab/widget/logout_dialog.dart';
import '../../registration_student/registration_student_step_one_screen.dart';
import '../../registration_student/registration_student_step_two_screen.dart';

class StudentSearchScreen extends BaseScreen {
  @override
  State<StudentSearchScreen> createState() => _StudentSearchScreenState();
}

class _StudentSearchScreenState extends BaseState<StudentSearchScreen, StudentSearchBloc> {
  final TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    codeController.addListener(() {
      final text = codeController.text;

      if (text.length >= 9) {
        bloc.searchStudent(text).then((value) {
          setState(() {
            bloc.student = value;
          });
        });
      } else {
        setState(() {
          bloc.student = null;
        });
      }
    });
  }

  @override
  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 410,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              image: DecorationImage(
                image: AssetImage('asset/search_stud_bag.png'), // Замените на нужную картинку
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Text(
                  S.of(context).mvcudIstifadiAxtar,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                  Text(
                  S.of(context).axtarBlmsinMvcudIstifadiHesabnnIdKodunuYazaraqValideynV,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                  Text(
                  S.of(context).qeydGrIstifadininHesabYoxdursaYeniIstifadiQeydiyyatDymsiniSxaraq,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: codeController,
                    decoration: InputDecoration(
                      hintText: S.of(context).axtar,
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return RegistrationStudentStepOneScreen(
                          isParent: '1',
                        );
                      },
                    ),
                  ),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: AppColors.gradient,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).yeniIstifadiQeydiyyat,
                        style: TextStyle(
                            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (bloc.student == null)
            Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  "asset/tex_not.png",
                  width: 180,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    S.of(context).yuxardakXanayaAgirdinIdKodunuYazaraqAxtarEdin,
                    style: TextStyle(
                        color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          if (bloc.student != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: bloc.student?.image ?? '',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (bloc.student?.name ?? '') + ' ' + (bloc.student?.surname ?? ''),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text((bloc.student?.code ?? "")),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) {
                          return LogoutDialog(
                            title: S.of(context).sizBuAgirdiZProfilinizLavEtmkIstyirsiniz,
                            postDelete: () async {
                              await bloc.selectStudentForParent(bloc.student?.id ?? 0).then(
                                (value) {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return SuccessScreen(
                                        title:
                                            S.of(context).agirdLavEdilmIlBalIstkGndrildiTsdiqEtdikdnSonra,
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            desc: '',
                          );
                        },
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: AppColors.gradient,
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  StudentSearchBloc provideBloc() {
    return StudentSearchBloc();
  }
}
