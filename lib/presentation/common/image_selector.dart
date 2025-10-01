import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../generated/l10n.dart';

Future<ImageSource> showSelectImageSourceAlert(
  BuildContext context,
) async {
  ImageSource source = await showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
            title: Text(S.of(context).kilSein),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text(S.of(context).qalereya),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(ImageSource.gallery);
                },
              ),
              CupertinoActionSheetAction(
                child: Text(S.of(context).kamera),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(ImageSource.camera);
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(S.of(context).lvEdin),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ));
  return source;
}
