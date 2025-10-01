import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../../../presentation/resourses/app_colors.dart';
import '../../../../../../data/network/response/packets_response.dart';
import '../../../../../../data/network/response/type_option.dart';
import '../../../../../../generated/l10n.dart';
import 'payment_web_screen.dart';

Future<void> showCardInputDialog({
  required List<PacketsResponse> list,
  required BuildContext context,
  required List<TypeOption> cardOptions,
  required String dropdownTitle,
  required int userId,
  required Function(String number, TypeOption selectedCard) onSubmit,
  int? initialPacketId, // ✅ новый параметр
}) async {
  final TextEditingController numberController = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();

  TypeOption? selectedCard;
  int? selectedPacketId;

  await showDialog(
    context: context,
    builder: (context) {
      bool didInit = false; // ✅ флаг инициализации

      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: StatefulBuilder(
          builder: (context, setState) {
            // ✅ инициализация один раз при построении
            if (!didInit) {
              if (initialPacketId != null) {
                final initPacket = list.firstWhere(
                      (packet) => packet.id == initialPacketId,
                  orElse: () => list.first,
                );
                selectedPacketId = initPacket.id;
                numberController.text = initPacket.discountedPrice.toString();
              }
              didInit = true;
            }

            bool isButtonEnabled = numberController.text.trim().isNotEmpty && selectedCard != null;

            void updateButtonState() {
              setState(() {});
            }

            numberController.addListener(updateButtonState);
            amountFocusNode.addListener(() {
              if (amountFocusNode.hasFocus && selectedPacketId != null) {
                setState(() {
                  selectedPacketId = null;
                });
              }
            });

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Text(S.of(context).qiymtPlanlar,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: AppColors.appColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.5),
                    ),
                    child: Column(
                      children: list.map((packet) {
                        final isSelected = selectedPacketId == packet.id;
                        return GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              selectedPacketId = packet.id;
                              numberController.text = packet.discountedPrice.toString();
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.appColor : Colors.white,
                              border: Border.all(
                                color:
                                isSelected ? AppColors.appColor : Colors.grey.withOpacity(0.3),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${packet.titleAz} - ${packet.discountedPrice} " + S.of(context).azn,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: isSelected ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected ? Colors.white : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: isSelected
                                      ? Center(
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(S.of(context).artrlanBalans,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 5),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        focusNode: amountFocusNode,
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration:   InputDecoration(
                          hintText: S.of(context).mbliYazn,
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Text(S.of(context).kartSein,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 5),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<TypeOption>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              selectedCard?.name ?? dropdownTitle,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          value: selectedCard,
                          icon: const Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          itemHeight: 50.0,
                          items: cardOptions.map((TypeOption card) {
                            return DropdownMenuItem<TypeOption>(
                              value: card,
                              child: Text(
                                card.titleAz ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (TypeOption? newCard) {
                            setState(() {
                              selectedCard = newCard;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child:   Text(S.of(context).bala, style: TextStyle(color: Colors.black)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isButtonEnabled ? AppColors.appColor : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: isButtonEnabled
                            ? () {
                          Navigator.of(context).pop();
                          onSubmit(numberController.text, selectedCard!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentWebScreen(
                                type: selectedCard?.titleAz == "Visa" ? "v" : "m",
                                amount: double.tryParse(numberController.text) ?? 0,
                                userId: userId,
                                selectedPacketId: selectedPacketId,
                              ),
                            ),
                          );
                        }
                            : null,
                        child:   Text(S.of(context).tsdiql, style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
