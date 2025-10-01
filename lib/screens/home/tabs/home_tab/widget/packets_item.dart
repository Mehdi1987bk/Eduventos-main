import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../data/network/response/packets_response.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../subjects/exam/questions/widget/html_math_parse.dart';

class PacketsItem extends StatelessWidget {
  final PacketsResponse packetsResponse;
  final int? packetId;

  const PacketsItem({
    super.key,
    required this.packetsResponse,
    this.packetId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          if (packetId == packetsResponse.id) Image.asset("asset/access_bag.png"),
          if (packetId != packetsResponse.id) Image.asset("asset/packets.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: AppColors.gradient,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(packetId == packetsResponse.id)
                    Text(
                      S.of(context).aktualPaket,
                      style:
                          TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      packetsResponse.titleAz,
                      style:
                          TextStyle(color: Colors.white, fontSize: packetId == packetsResponse.id ? 12 : 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "₼ ${packetsResponse.price}",
                          style: TextStyle(
                            color: AppColors.redPurp,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                        S.of(context).valt +" ${packetsResponse.discountedPrice} ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "/ ${packetsResponse.month} " + S.of(context).aylq,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
