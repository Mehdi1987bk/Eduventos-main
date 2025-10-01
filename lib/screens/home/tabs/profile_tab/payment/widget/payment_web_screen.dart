import 'dart:io';

import 'package:eduventure/domain/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../data/network/request/payments_initiate_request.dart';
import '../../../../../../main.dart';

class PaymentWebScreen extends StatefulWidget {
  final double? amount;
  final String? url;
  final String? type;
  final int? userId;
  final int? selectedPacketId;

  const PaymentWebScreen(
      {Key? key, this.amount, this.url, this.type, this.userId, this.selectedPacketId})
      : super(key: key);

  @override
  _PaymentWebScreenState createState() => _PaymentWebScreenState();
}

class _PaymentWebScreenState extends State<PaymentWebScreen> {
  late final Future<String> paymentUrl;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.amount != null) {
      paymentUrl = sl
          .get<AuthRepository>()
          .paymentsInitiate(PaymentsInitiateRequest(
            amount: widget.amount!,
            type: widget.type ?? "",
            userId: widget.userId ?? 0,
            packageId: widget.selectedPacketId ?? 0,
          ))
          .then((response) => response.redirectUrl);
    } else if (widget.url != null) {
      paymentUrl = Future.value(widget.url);
    }

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            print("Navigating to: ${request.url}");
            if (Uri.parse(request.url).host == " .az") {
              Navigator.pop(context, true);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
         Future.delayed(
          Duration(seconds: 5),
          () => sl.get<AuthRepository>().getUserDetails(),
        );
        if (await _controller.canGoBack()) {
          _controller.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: FutureBuilder<String>(
            future: paymentUrl,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasData) {
                _controller.loadRequest(Uri.parse(snapshot.requireData));

                return Stack(
                  children: [
                    WebViewWidget(controller: _controller),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () async {
                            if (await _controller.canGoBack()) {
                              Future.delayed(
                                Duration(seconds: 5),
                                () => sl.get<AuthRepository>().getUserDetails(),
                              );
                              Navigator.pop(context);
                              _controller.goBack();
                            } else {
                              Future.delayed(
                                Duration(seconds: 5),
                                () => sl.get<AuthRepository>().getUserDetails(),
                              );
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
