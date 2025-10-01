import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/response/user.dart';
import '../notification/natification_screen.dart';

class HomeUserInfo extends StatelessWidget {
  final User user;

  const HomeUserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 45,
        left: 10,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()=> Navigator.push(context,  CupertinoPageRoute(builder: (BuildContext context) {
              return NotificationScreen(user: user,);
            })),
            child: Image.asset(
              "asset/notif.png",
              width: 30,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Text(
            (user.name ?? "") + " " + user.surname,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  user.image ?? "https://e-deal.az/postImage/default.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
