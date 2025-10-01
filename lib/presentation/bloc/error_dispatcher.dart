import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';
import 'base_screen.dart';
import 'error_handler.dart';

typedef bool ErrorHandler(Object error);

mixin ErrorDispatcher<Page extends BaseScreen, Bloc extends BaseBloc> on BaseState<Page, Bloc> {
  StreamSubscription? errorSubscription;

  @override
  void initState() {
    super.initState();
    errorSubscription = bloc.errorStream
        .transform(
      ThrottleStreamTransformer<Object>(
            (_) => TimerStream<Object>(
          true,
          const Duration(seconds: 2),
        ),
      ),
    )
        .listen((error) {
      if (error.runtimeType == DioError &&
          ((error as DioError).response?.statusCode == 404 || error.response?.statusCode == 403)) {
        final responseBody = error.response?.data;
        if (responseBody is Map) {
          final errorMessage = responseBody["desc"] ?? responseBody["message"];
          if (errorMessage != null) {
            return showOverlayError(errorMessage);
          }
        }
        return;
      }
      if (errorHandler == null) {
        showOverlayError(parseError(error, context));
      } else {
        if (errorHandler!.call(error)) {
          showOverlayError(parseError(error, context));
        }
      }
    });
  }

  @override
  void dispose() {
    errorSubscription?.cancel();
    super.dispose();
  }

  ErrorHandler? get errorHandler => null;


  void showOverlayError(String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}



