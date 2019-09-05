import 'package:flutter/material.dart';
import 'bloc_message.dart';
export 'bloc_message.dart';

class MessageProvider extends InheritedWidget {
  final MessageBloc bloc;

  MessageProvider({Key key, Widget child})
      : bloc = MessageBloc(),
        super(key: key, child: child);

  bool updateShouldNotify (_) => true;

  static MessageBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MessageProvider)
    as MessageProvider).bloc;
  }

}