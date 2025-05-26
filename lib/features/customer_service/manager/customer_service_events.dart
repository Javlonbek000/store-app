part of 'customer_service_bloc.dart';

sealed class CustomerServiceEvents {}

final class ChatMessagesSend extends CustomerServiceEvents {
  final String message;

  ChatMessagesSend({required this.message});
}

final class ChatMessageReceived extends CustomerServiceEvents {
  final Map<String, dynamic> message;

  ChatMessageReceived({required this.message});
}
