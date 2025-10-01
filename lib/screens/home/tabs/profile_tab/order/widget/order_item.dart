import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/network/response/order_details.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/resourses/app_colors.dart';
import 'order_product_item.dart';

class OrderItem extends StatefulWidget {
  final OrderDetails order;

  const OrderItem({super.key, required this.order});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                S.of(context).sifariNmrsi + " " + widget.order.id.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: AppColors.textColor),
                    child: Text(
                      widget.order.status.name,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.textColor,
                  width: 1,
                )),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded; // Изменяем состояние списка
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).mhsullar, // Текст описания
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                      ],
                    ),
                    if (isExpanded) // Показываем список, если он "развернут"
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.order.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return OrderProductItem(
                            product: widget.order.products[index],
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.order.note != null)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                S.of(context).qiymt + ": " + (widget.order.note ?? ""),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              S.of(context).qiymt + ": " + (widget.order.price.toString() ?? "") + " Azn",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
