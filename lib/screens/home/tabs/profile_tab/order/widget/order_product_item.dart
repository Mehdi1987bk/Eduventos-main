import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../data/network/response/product.dart';
import '../../../../../../generated/l10n.dart';

class OrderProductItem extends StatelessWidget {
  final Product product;

  const OrderProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: product.images.first,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width - 170,
                  child: Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
              Text(
                product.price.toString() + " "+S.of(context).azn +" " + " (${product.count.toString()} " + S.of(context).dd,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}
