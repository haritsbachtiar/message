import 'package:flutter/material.dart';
import 'bloc/provider_message.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = MessageProvider.of(context);
    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("sdfsd"),
      ),
      body: Padding(padding: EdgeInsets.all(36.0),
          child: Column(
          children: <Widget>[
                Container(
                margin: EdgeInsets.only(bottom: 24.0),
                    child: StreamBuilder(
                      stream: bloc.message,
                      builder: (context, snapshot) {
                        return Column(
                          children: <Widget>[
                        Text(snapshot.hashCode.toString()),
                        Text(snapshot.connectionState.toString()),
                        Text(snapshot.hasData.toString()),
                        Text(snapshot.requireData.toString()),
                            TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: bloc.changeMessage,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  labelText: 'MESASGE',
                                  errorText: snapshot.error
                              ),
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.blue
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
            StreamBuilder(
              stream: bloc.channel,
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        Text(snapshot.data.toString()),
                        Text(snapshot.hashCode.toString()),
                        Text(snapshot.connectionState.toString()),
                        Text(snapshot.hasData.toString()),
                        Text(snapshot.requireData.toString())
                      ],
                    ),
                  );
                }
                return Text('');
              },
            )
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          bloc.sendMessage();
        },
      child: Icon(Icons.send),),
    );
  }
}