// ignore: file_names
import 'package:flutter/material.dart';
class TextInputWidget extends StatefulWidget {
  

  final Function(String) callback;

  const TextInputWidget(this.callback, {super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();


  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  void click(){
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration:  InputDecoration(
          prefixIcon: const Icon(Icons.message),
          labelText: 'Type a message here:',
          suffixIcon: IconButton( 
            icon: const Icon(Icons.send),
            onPressed: click,
            splashColor: Colors.blue,
            tooltip: "Post message",
            )),
        
        ); 

  }
}