import 'package:flutter/material.dart';
import 'message.dart';
import 'bloc/provider_message.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MessageProvider(
      child: MaterialApp(
        title: 'messageApps',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings){
    return MaterialPageRoute(builder: (context){
      return Message();
    });
  }

}