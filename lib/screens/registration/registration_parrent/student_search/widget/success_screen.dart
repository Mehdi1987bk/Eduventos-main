import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../generated/l10n.dart';

class SuccessScreen extends StatelessWidget {
  final String title;

  const SuccessScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

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
              children: [
                SizedBox(height: 20),
                Center(child: Image.asset("asset/success.png", width: 200, height: 200)),

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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
