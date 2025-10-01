import 'package:eduventure/domain/repositories/auth_repository.dart';
import 'package:eduventure/presentation/bloc/base_screen.dart';

import '../../../../../data/network/request/approve_notify_request.dart';
import '../../../../../data/network/response/get_notifications.dart';
import '../../../../../domain/entities/pagination.dart';
import '../../../../../main.dart';
import '../../../../../presentation/bloc/paginable_bloc.dart';
// Future<Pagination<GetNotifications>> getNotifications(int page, int isParent)

class NotificationBloc extends PaginableBloc<GetNotifications> {
  final authRepository = sl.get<AuthRepository>();
  late int isParent = 0;
  final Stream onReflash;

  NotificationBloc(this.onReflash);

  @override
  void init() {
    super.init();
    onReflash.listen((event) {
      load(refresh: true);
    });
  }

  Future<void> loadList() async {
    load(refresh: true);
  }

  Future<void> approveNotify(ApproveNotifyRequest request) =>
      run(authRepository.approveNotify(request));

  @override
  Future<Pagination<GetNotifications>> provideSource(int page) async {
    return run(authRepository.getNotifications(page, isParent));
  }
}
