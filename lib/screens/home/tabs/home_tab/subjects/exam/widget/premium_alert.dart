import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../data/network/response/user.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../presentation/resourses/app_colors.dart';
import '../../../../profile_tab/payment/payment_screen.dart';

class PremiumAlert extends StatelessWidget {
  final String title;
  final String desc;
  final bool isUserDeleted;
  final User user;

  const PremiumAlert(
      {Key? key,
      required this.title,
      required this.user,
      this.isUserDeleted = false,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 10,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(22.0))),
      contentPadding: EdgeInsets.zero,
      children: [
        Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(22.0)), color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (desc != "")
                    Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 5, right: 5),
                      child: Text(
                        desc,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              S.of(context).lvEt,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(userId: user.id),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.appColor,
                            ),
                            child: Center(
                                child: Text(
                              S.of(context).balansArtr,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
