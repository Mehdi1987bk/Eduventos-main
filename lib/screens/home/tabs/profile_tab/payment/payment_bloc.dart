import 'package:rxdart/rxdart.dart';

import '../../../../../data/network/request/payments_initiate_request.dart';
import '../../../../../data/network/request/purchases_request.dart';
import '../../../../../data/network/response/packets_response_list.dart';
import '../../../../../data/network/response/payments_initiate_response.dart';
import '../../../../../data/network/response/purchases_response.dart';
import '../../../../../data/network/response/user.dart';
import '../../../../../domain/repositories/auth_repository.dart';
import '../../../../../main.dart';
import '../../../../../presentation/bloc/base_bloc.dart';

class PaymentBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();
  late final Stream<User> userDetails =
      ValueConnectableStream(authRepository.userDetails).autoConnect();
  late final Stream<int> userType =
  ValueConnectableStream(authRepository.userType).autoConnect();

  late final Future<PacketsResponseList> getPackets = authRepository.getPackets();

  Future<PurchasesResponse> purchases(PurchasesRequest request) async {
    return authRepository.purchases(request);
  }
}
