import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  const Botao(
      {super.key, required this.texto, required this.cor, required this.callback});
  final String texto;
  final Color cor;
  final Function callback;
  
  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.2),
      child: Center(
          child: FloatingActionButton.large(
        backgroundColor: widget.cor,
        onPressed: () {
          if (widget.texto == 'C' || widget.texto == '=') {
            widget.callback();
          }else{
           widget.callback(widget.texto);      
          }
        },
        child: Text(
          widget.texto,
          style: TextStyle(color: Colors.white),
          textScaleFactor: 3,
        ),
      )),
    );
  }
}
