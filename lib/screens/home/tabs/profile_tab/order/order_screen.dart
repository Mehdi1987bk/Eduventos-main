import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/order_item.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/response/order_details_data.dart';
import '../../../../../presentation/bloc/base_screen.dart';
import 'order_bloc.dart';

class OrderScreen extends BaseScreen {
  OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends BaseState<OrderScreen, OrderBloc> {
  @override
  Widget body() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [

          FutureBuilder<OrderDetailsData>(
              future: bloc.getOrders(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(

                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.requireData.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OrderItem(
                        order: snapshot.requireData.data[index],
                      );
                    },
                  );
                }
                return SizedBox();
              })
        ],
      ),
    );
  }

  @override
  OrderBloc provideBloc() {
    return OrderBloc();
  }
}
