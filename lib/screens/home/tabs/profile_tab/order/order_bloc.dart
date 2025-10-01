import '../../../../../data/network/response/order_details_data.dart';
import '../../../../../domain/repositories/auth_repository.dart';
import '../../../../../main.dart';
import '../../../../../presentation/bloc/base_bloc.dart';

class OrderBloc extends BaseBloc {
final authRepository = sl.get<AuthRepository>();

  Future<OrderDetailsData> getOrders() async {
    return authRepository.orderDetails();
  }

}