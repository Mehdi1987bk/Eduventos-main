import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eduventure/presentation/common/not_internet_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_bloc.dart';
import 'app_theme.dart';
import 'generated/l10n.dart';
import 'main.dart';
import 'presentation/bloc/bloc_provider.dart';
import 'presentation/resourses/app_colors.dart';
import 'screens/splesh/splesh_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class GrandWayApp extends StatefulWidget {
  @override
  _GrandWayAppState createState() => _GrandWayAppState();
}

class _GrandWayAppState extends State<GrandWayApp> {
  void initState() {
    super.initState();
    checkNotificationPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;
      if (notification != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          // notification.hashCode,
          message.sentTime?.millisecond ?? 1,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'ic_notification',
                color: AppColors.appColor),
          ),
        );
      }
    });
  }

  Future<void> checkNotificationPermission() async {
    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      bloc: AppBloc(),
      child: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult? _connectionStatus;

  @override
  void initState() {
    super.initState();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      if (results.isNotEmpty) {
        setState(() {
          _connectionStatus = results.first;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasInternet = _connectionStatus != ConnectivityResult.none;
    final bloc = BlocProvider.of<AppBloc>(context);

    return MaterialApp(
      navigatorKey: navigatorKey,
      navigatorObservers: [routeObserver],
      title: 'Eduventure',
      theme: appTheme,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: SplashScreen(),
    );
  }
}
