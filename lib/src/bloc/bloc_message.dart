import 'dart:async';
import 'dart:io';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:rxdart/rxdart.dart';

class MessageBloc {
  final WebSocketChannel _channel = IOWebSocketChannel.connect("ws://echo.websocket.org");
  final _message = BehaviorSubject<String>();

  //Change data
  Function(String) get changeMessage => _message.sink.add;

  Stream<dynamic> get channel => _channel.stream;

  //Add data to Stream (Getters)
  Stream<String> get message =>
      _message
          .stream
          .transform(
          StreamTransformer<String, String>.fromHandlers(
              handleData: (message, sink) {
                  sink.add(message);
              }
          )
      );

  sendMessage() {
    var text = _message.value;
    print(text);
    var channel = _channel;
    print(channel);

    _channel.sink.add(text);
  }

  dispose() {
    _message.close();
  }
}