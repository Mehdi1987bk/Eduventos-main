import 'package:eduventure/screens/home/tabs/home_tab/chat/widget/chat_alert_header.dart';
import 'package:eduventure/screens/home/tabs/home_tab/chat/widget/chat_loading_indicator.dart';
import 'package:eduventure/screens/home/tabs/home_tab/chat/widget/chat_message_item.dart';
import 'package:flutter/material.dart';
import '../../../../../data/network/request/chatbot_request.dart';
import '../../../../../data/network/response/chatbot_response.dart';
import '../../../../../data/network/response/choices.dart';
import '../../../../../data/network/response/user.dart';
import '../../../../../domain/repositories/auth_repository.dart';
import '../../../../../main.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../home_tab_bloc.dart';

class ChatAlertDialog extends StatefulWidget {
  final User user;
  final ChatbotResponse initialResponse;

  const ChatAlertDialog({
    super.key,
    required this.initialResponse,
    required this.user,
  });

  @override
  State<ChatAlertDialog> createState() => _ChatAlertDialogState();
}

class _ChatAlertDialogState extends State<ChatAlertDialog> {
  final List<ChatbotResponse> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  final AuthRepository _authRepository = sl.get<AuthRepository>();

  @override
  void initState() {
    super.initState();
    _messages.add(widget.initialResponse);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _handleChoice(int index, Choices choice) async {
    setState(() => _isLoading = true);

    final updated = _messages[index].copyWith(selectedChoiceLabel: choice.label);
    setState(() => _messages[index] = updated);

    final response = await _authRepository.chatbot(ChatbotRequest(message: choice.value));

    setState(() {
      _messages.add(response);
      _isLoading = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            ChatAlertHeader(onClose: () => Navigator.of(context).pop()),
            const Divider(height: 1, color: AppColors.appYello),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length + 1, // +1 для Image и SizedBox
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // Первый элемент — это Image и SizedBox
                        return Column(
                          children: [
                            Image.asset(
                              "asset/bot-removebg-preview.png",
                              height: 160,
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      }

                      // Остальные — это сообщения
                      final message = _messages[index - 1];
                      return ChatMessageItem(
                        message: message,
                        index: index - 1,
                        isLast: index - 1 == _messages.length - 1,
                        onChoiceSelected: _handleChoice,
                        user: widget.user,
                      );
                    },
                  ),
                  if (_isLoading) const ChatLoadingIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
