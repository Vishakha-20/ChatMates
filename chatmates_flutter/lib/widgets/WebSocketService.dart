import 'dart:convert';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class WebSocketService {
  late StompClient stompClient;
  Function(Map<String, dynamic>)? onMessageReceived;

  void connect() {
    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: 'http://localhost:8080/ws',
        onConnect: _onConnect,
        onWebSocketError: (dynamic error) => print('WebSocket error: $error'),
        onStompError: (StompFrame frame) => print('STOMP error: ${frame.body}'),
        onDisconnect: (frame) => print('Disconnected'),
      ),
    );

    stompClient.activate();
  }

  void _onConnect(StompFrame frame) {
    print("STOMP connected");

    stompClient.subscribe(
      destination: '/topic/messages',
      callback: (StompFrame frame) {
        if (frame.body != null) {
          try {
            final parsedMessage = jsonDecode(frame.body!);
            if (onMessageReceived != null) {
              onMessageReceived!(parsedMessage);
            }
          } catch (e) {
            print("❌ Error decoding message: $e");
          }
        }
      },
    );
  }

  void sendMessage(String messageContent) {
    final message = {
      "sender": "vishakha",
      "content": messageContent,
      "timestamp": DateTime.now().toIso8601String(),
    };

    stompClient.send(destination: '/app/send', body: jsonEncode(message));
  }
}
