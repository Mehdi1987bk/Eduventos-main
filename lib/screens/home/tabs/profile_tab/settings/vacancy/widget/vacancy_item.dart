import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../data/network/response/vacancy.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../home_tab/post/post.dart';
import '../../../../home_tab/subjects/exam/questions/widget/html_math_parse.dart';
import '../../../../home_tab/widget/post_item.dart';
import '../vacancy_details/vacancy_details_screen.dart';

class VacancyItem extends StatelessWidget {
  final Vacancy vacancy;

  const VacancyItem({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 3, left: 9),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  vacancy.titleAz ?? "null",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 25, left: 0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    constraints: BoxConstraints(
                      maxHeight: 45,
                    ),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: FormulaHtmlWidget(
                        html: vacancy.contentAz ?? "",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 33,
                width: 60,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.appColor.withOpacity(0.3), width: 2)),
                child: Center(
                  child: Text(
                    formatDay(vacancy.createdAt ?? DateTime.now()),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 10),
                child: Image.asset(
                  "asset/eye.png",
                  width: 17,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 15),
                child: Text(
                  vacancy.readCount.toString() + " " + S.of(context).bax,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) => VacancyDetailsScreen(
                        vacancy: vacancy,

                    ),
                  ),
                ),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: AppColors.gradient,
                    ),
                  ),
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  margin: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: Text(
                      S.of(context).detallaraKe,
                      style:
                          TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
