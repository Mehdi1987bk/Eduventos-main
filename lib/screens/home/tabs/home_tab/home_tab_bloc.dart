import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:eduventure/presentation/bloc/base_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../data/network/request/chatbot_request.dart';
import '../../../../data/network/request/firebase_notif.dart';
import '../../../../data/network/response/banners_response.dart';
import '../../../../data/network/response/chatbot_response.dart';
import '../../../../data/network/response/get_posts_response_list.dart';
import '../../../../data/network/response/menu_list_response.dart';
import '../../../../data/network/response/packets_response_list.dart';
import '../../../../data/network/request/subs_pay_request.dart';
import '../../../../data/network/response/settings_response.dart';
import '../../../../data/network/response/subs_pay_status.dart';
import '../../../../data/network/response/user.dart';
import '../../../../data/network/response/video_result_response.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../main.dart';

class HomeTabBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();
  late int postId = 1;
  late final StreamSubscription _tokenSubscription;

  @override
  void init() {
    FirebaseMessaging.instance
        .getToken()
        .then(_updateFirebaseToken)
        .onError((error, stackTrace) => print("Eroooooooooooor $error"));
    _tokenSubscription = FirebaseMessaging.instance.onTokenRefresh.listen((event) async {
      await _updateFirebaseToken(event);
    });
    authRepository.getUserDetails();
  }

  Future<void> _updateFirebaseToken(String? event) async {
    if (event != null) {
      final deviceInfoPlugin = DeviceInfoPlugin();
      var deviceId = '';
      if (Platform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? '';
      } else {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        deviceId = androidInfo.id ?? '';
      }
      final packageInfo = await PackageInfo.fromPlatform();
      await authRepository.updateFirebaseToken(FirebaseNotif(
        token: event,
        deviceId: deviceId,
        notificationType: Platform.isIOS ? 2 : 1,
      ));
    }
  }

  late final Stream<User> userDetails =
      ValueConnectableStream(authRepository.userDetails).autoConnect();

  late final Stream<int> userType = ValueConnectableStream(authRepository.userType).autoConnect();
  late final Future<SettingsResponse> settings = authRepository.settings();

  Future<SubsPayStatus> subsPay(SubsPayRequest request) => run(authRepository.subsPay(request));
  late final Future<BannersResponse> getSlides = authRepository.getSlides();
  late final Future<PacketsResponseList> getPackets = authRepository.getPackets();
  late final Future<MenuListResponse> menuList = authRepository.menuList("post");

  Stream<VideoResultResponse> getVideo(int isGroup) => authRepository.getVideo(isGroup);

  Future<ChatbotResponse> chatbot(String message) => authRepository.chatbot(
        ChatbotRequest(message: message),
      );

  Future<GetPostsResponseList> getPosts(String id) {
    return authRepository.getPosts(id);
  }

  Future<bool> gaveUserId(int id) {
    return authRepository.gaveUserId(id);
  }
}
