import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class WebSocketService {
  late StompClient stompClient;
  bool isConnected = false;

  void connect() {
    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: 'http://localhost:8084/chat', // Replace with your local IP
        onConnect: onConnect,
        onWebSocketError: (dynamic error) {
          print('WebSocket Error: $error');
        },
        onStompError: (dynamic error) {
          print('STOMP Error: $error');
        },
        onDisconnect: (_) {
          isConnected = false;
          print('Disconnected 🔌');
        },
        onDebugMessage: (msg) => print('Debug: $msg'),
      ),
    );
    stompClient.activate();
  }

  void onConnect(StompFrame frame) {
    isConnected = true;
    print("Connected ✅");

    stompClient.subscribe(
      destination: '/topic/messages',
      callback: (frame) {
        print('📩 Message received: ${frame.body}');
      },
    );
  }

  void sendMessage(String text) {
    if (isConnected && stompClient.connected) {
      stompClient.send(
        destination: '/app/send',
        body: '{"content": "$text", "sender": "mihir", "timestamp": ""}',
      );
    } else {
      print("⚠️ Cannot send message: WebSocket not connected.");
    }
  }
}
