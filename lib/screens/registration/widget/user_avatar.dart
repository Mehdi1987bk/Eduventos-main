import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final File? file;
  final String? imgUrl;

  const UserAvatar({Key? key, required this.file, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = file != null
        ? FileImage(file!)
        : CachedNetworkImageProvider(
             imgUrl!,
          );
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: imageProvider as ImageProvider),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
    );
  }
}
