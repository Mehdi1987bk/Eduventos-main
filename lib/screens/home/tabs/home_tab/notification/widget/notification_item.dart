import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../data/network/response/get_notifications.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/resourses/app_colors.dart';
import 'accept_recect_alert.dart';

class NotificationItem extends StatelessWidget {
  final GetNotifications notification;
  final VoidCallback postAccepted;
  final VoidCallback postDelete;

  final dateFormat = DateFormat('d MMMM, y, hh:mm');

  NotificationItem({
    Key? key,
    required this.notification,
    required this.postAccepted,
    required this.postDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.1))),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 0, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.appColor.withOpacity(0.3),
            ),
            child: Center(
              child: notification.image != null
                  ? CachedNetworkImage(imageUrl: notification.image ?? "")
                  : Image.asset("asset/notiv_ic.png"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title ?? "",
                style: TextStyle(
                    color: AppColors.textColor, fontWeight: FontWeight.w700, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  notification.text ?? "",
                  style: TextStyle(
                      color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 13),
                ),
              ),
              if (notification.type == "add-student")
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) {
                      return AcceptRecectAlert(
                        title: S.of(context).valideyniQbulEtmkIstyirsinizmi,
                        postDelete: () async {
                          postDelete();
                        },
                        postAccepted: () async {
                          postAccepted();
                        },
                        desc: '',
                        imageUrl: "asset/request.png",
                      );
                    },
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: AppColors.gradient,
                      ),
                    ),
                    child: Text(
                      S.of(context).cavablamaqNKliklyin,
                      style:
                          TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              Container(
                margin: EdgeInsets.only(top: 8),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  dateFormat.format(notification.createdAt) ?? "",
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
