import 'package:dio/dio.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'call_interceptor.dart';
import 'data/cache/cache_manager.dart';
import 'data/cache/data_cache_manager.dart';
import 'data/network/api/auth_api.dart';
import 'data/network/response/latest_purchase.dart';
import 'data/network/response/type_option.dart';
import 'data/network/response/user.dart';
import 'data/repositories/data_auth_repository.dart';
import 'domain/repositories/auth_repository.dart';
import 'eduventure_app.dart';
import 'file_output.dart';
import 'firebase_options.dart';
import 'package:logger/logger.dart' hide FileOutput;

final GetIt sl = GetIt.instance;
final logger = Logger(printer: SimplePrinter());
const baseUrl = 'https://eduventos.az/';
// const baseUrl = 'https://test.eduventure.az/';
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
const _authCache = 'AuthCache';
late final Box settingsBox;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Seeend");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final notification = message.notification;
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
            icon: 'ic_notification',
            color: AppColors.appColor),
      ),
    );
  }
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
late FileOutput fileLogger;

late final Box authBox;

String formatPrice(double price) {
  return price % 1 == 0 ? price.toInt().toString() : price.toString();
}

String formatStringPrice(String priceStr) {
  double price = double.tryParse(priceStr) ?? 0;
  return price % 1 == 0 ? price.toInt().toString() : price.toString();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final file = await createLogFile();

  fileLogger = FileOutput(file);

  final dir = await getApplicationDocumentsDirectory();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(TypeOptionAdapter())
    ..registerAdapter(LatestPurchaseAdapter());
  _registerDependency();
  authBox = await Hive.openBox(_authCache);

  runApp(GrandWayApp());
}

void _registerDependency() {
  final dio = _initDio();
  sl.registerLazySingleton<AuthApi>(() => AuthApi(dio));
  sl.registerLazySingleton<AuthRepository>(() => DataAuthRepository());
  sl.registerLazySingleton<CacheManager>(() => DataCacheManager());
}

Dio _initDio() {
  final dio = Dio();

  dio.options.headers["content-type"] = "application/json";
  dio.options.headers["accept"] = "application/json";
  dio.options.connectTimeout = Duration(seconds: 120);
  dio.options.receiveTimeout = Duration(seconds: 120);
  dio.options.sendTimeout = Duration(seconds: 120);
  dio.interceptors.add(CallInterceptor());
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, logPrint: logger.d));
  sl.registerLazySingleton<Dio>(() => dio);

  return dio;
}
