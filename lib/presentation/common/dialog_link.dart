import 'package:flutter/material.dart';

class DialogLink extends StatelessWidget {
  final String url;

  const DialogLink({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SizedBox(
          height: 500,
          // child: WebView(
          //   initialUrl: url,
          //   javascriptMode: JavascriptMode.unrestricted,
          // ),
        )
      ],
    );
  }
}
