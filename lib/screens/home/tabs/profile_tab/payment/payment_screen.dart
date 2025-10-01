import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/payment/payment_bloc.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/payment/widget/add_balance_item.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/payment/widget/payment_alert.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/payment/widget/payment_item.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/request/purchases_request.dart';
import '../../../../../data/network/response/packets_response_list.dart';
import '../../../../../data/network/response/purchases_response.dart';
import '../../../../../data/network/response/type_option.dart';
import '../../../../../data/network/response/user.dart';
import '../../../../../domain/repositories/auth_repository.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../order/widget/category_navigator_pop.dart';

class PaymentScreen extends BaseScreen {
  final int userId;
  final int? initialPacketId;

  PaymentScreen({super.key, required this.userId, this.initialPacketId});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends BaseState<PaymentScreen, PaymentBloc> {
   bool _dialogShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_dialogShown && widget.initialPacketId != null) {
      _dialogShown = true;

      bloc.getPackets.then((packetsResponseList) {
        if (!mounted) return;

        final packets = packetsResponseList.list;

        showCardInputDialog(
          context: context,
          cardOptions: [
            TypeOption(name: S.of(context).visa, titleAz: "Visa", id: 1),
            TypeOption(name: S.of(context).mastercard, titleAz: "MasterCard", id: 2),
          ],
          dropdownTitle: S.of(context).kartNvnSein,
          onSubmit: (number, card) {
            // TODO: обработка при отправке
          },
          userId: widget.userId,
          list: packets,
          initialPacketId: widget.initialPacketId,
        );
      });
    }
  }

  @override
  Widget body() {
    return SafeArea(
      child: StreamBuilder<User>(
        stream: bloc.userDetails,
        builder: (context, userSnapshot) {
          if (!userSnapshot.hasData) return Center(child: CircularProgressIndicator());

          final user = userSnapshot.requireData;

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: CategoryNavigatorPop(title: S.of(context).balans),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Image.asset("asset/balans_back.png"),
                    StreamBuilder<int?>(
                      stream: bloc.userType,
                      builder: (context, userIdSnapshot) {
                        final balance = userIdSnapshot.hasData && userIdSnapshot.data != null
                            ? user.children!.firstWhere((e) => e.id == userIdSnapshot.data).balance
                            : user.balance;

                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).mumiMbl,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "$balance " + S.of(context).azn,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    FutureBuilder<PacketsResponseList>(
                      future: bloc.getPackets,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.requireData.list.isNotEmpty) {
                          return Positioned(
                            bottom: 20,
                            right: 20,
                            child: InkWell(
                              onTap: () {
                                showCardInputDialog(
                                  context: context,
                                  cardOptions: [
                                    TypeOption(name: "Visa", titleAz: "Visa", id: 1),
                                    TypeOption(name: "MasterCard", titleAz: "MasterCard", id: 2),
                                  ],
                                  dropdownTitle: S.of(context).kartNvnSein,
                                  onSubmit: (number, card) {},
                                  userId: widget.userId,
                                  list: snapshot.requireData.list,
                                  initialPacketId: widget.initialPacketId,
                                );
                              },
                              child: AddBalanceItem(),
                            ),
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ],
                ),
              ),
              FutureBuilder<PurchasesResponse>(
                future: bloc.purchases(
                  PurchasesRequest(userId: widget.userId),
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.requireData.list.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          S.of(context).tranzaksiyalar,
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }
                    return SizedBox();
                  }
                  return SizedBox();
                },
              ),
              FutureBuilder<PurchasesResponse>(
                future: bloc.purchases(
                  PurchasesRequest(userId: widget.userId),
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return SizedBox();
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.requireData.list.length,
                    itemBuilder: (context, index) {
                      return PaymentItem(purchase: snapshot.requireData.list[index]);
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  PaymentBloc provideBloc() => PaymentBloc();
}
