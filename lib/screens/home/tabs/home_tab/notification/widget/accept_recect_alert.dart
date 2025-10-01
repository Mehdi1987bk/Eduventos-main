import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/resourses/app_colors.dart';

class AcceptRecectAlert extends StatelessWidget {
  final String title;
  final String desc;
  final VoidCallback postDelete;
  final VoidCallback postAccepted;
  final bool isUserDeleted;
  final String? imageUrl;

  const AcceptRecectAlert(
      {Key? key,
      required this.title,
      required this.postDelete,
      required this.postAccepted,
      this.imageUrl,
      this.isUserDeleted = false,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 10,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
      contentPadding: EdgeInsets.zero,
      children: [
        Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)), color: Colors.white),
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
                  if (imageUrl != null)
                    Center(
                        child: Image.asset(
                      imageUrl ?? "",
                      width: 150,
                    )),
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
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(top: 12, bottom: 12, left: 5, right: 5),
                  //   child: Text(
                  //     desc,
                  //     style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.grey),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            postDelete();
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              S.of(context).mtinaEt,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            postAccepted();
                            Navigator.pop(context);
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
                              S.of(context).qbulEt,
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
