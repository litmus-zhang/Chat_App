import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textcontroller = new TextEditingController();
  final List<ChatMessage> _message = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textcontroller.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textComposerwidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.blueAccent),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: [
              new Flexible(
                child: TextField(
                  decoration:
                      new InputDecoration.collapsed(hintText: "Send a Message"),
                  controller: _textcontroller,
                  onSubmitted: _handleSubmitted,
                ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textcontroller.text)),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    int length = _message.length;
    var listView = new ListView(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemExtent: length.toDouble());
    // ignore: unused_label
    itemBuilder:
    // ignore: unnecessary_statements
    (_, int index) => _message[index];

    return new Column(
      children: [
        new Flexible(child: listView),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerwidget(),
        )
      ],
    );
  }
}
