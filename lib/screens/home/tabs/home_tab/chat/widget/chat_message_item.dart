import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:eduventure/data/network/response/user.dart';
import '../../../../../../data/network/request/exam.dart';
import '../../../../../../data/network/response/chatbot_response.dart';
import '../../../../../../data/network/response/choices.dart';
import '../../../../../../presentation/resourses/app_colors.dart';
import '../../subjects/exam/start_questions/start_questions_screen.dart';

class ChatMessageItem extends StatelessWidget {
  final ChatbotResponse message;
  final bool isLast;
  final int index;
  final User user;
  final void Function(int, Choices) onChoiceSelected;

  const ChatMessageItem({
    super.key,
    required this.message,
    required this.index,
    required this.isLast,
    required this.onChoiceSelected,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = message.selectedChoiceLabel != null;
    final hasChoices = message.choices.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Сообщение от бота
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Image.asset("asset/chat_bot.png", height: 40),
              const SizedBox(width: 8),
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.appColor.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  message.text,
                  style: const TextStyle(
                      fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),

        // Выбранный ответ
        if (isSelected)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.appYelloNew.withOpacity(0.8),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message.selectedChoiceLabel ?? "",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          user.image ?? "https://e-deal.az/postImage/default.jpg",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Кнопки выбора
        if (isLast && hasChoices && !isSelected)
          Align(
            alignment: Alignment.centerRight,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: message.choices.map((choice) {
                return GestureDetector(
                  onTap: () {
                    if (choice.clickable == true) {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartQuestions(
                            exam: choice.exam ?? Exam(id: 1),
                            title: '',
                          ),
                        ),
                      );
                    } else {
                      onChoiceSelected(index, choice);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.68,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.appYelloNew,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          choice.label,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
