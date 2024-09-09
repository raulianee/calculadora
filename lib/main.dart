
import 'package:calculadora/view/components/botao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 59, 59, 59),
          title: const Text('Calculadora'),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
        ),
        body: const Calculadora(),
      ),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String resultado = '0';

  void apagar() {
    setState(() {
      resultado = '0';
    });
  }

  void atualizar(String texto) {
    setState(() {
      if (resultado == '0') {
        resultado = '';

      }
      resultado += texto;
    });
  }

void calculo([String operacao = '']) {
  setState(() {
    String n1 = resultado.substring(0, resultado.indexOf(RegExp(r'[+\-/x/%]')));
    String n2 = resultado.substring((resultado.indexOf(RegExp(r'[+\-/x/%]')) + 1));

    if (resultado.contains('+')) {
      try{
              resultado = (int.parse(n1) + int.parse(n2)).toString();
      } catch(e) {
        resultado= 'erro ta maluco';
      }
    } else if (resultado.contains('-')) {
      try{
              resultado = (int.parse(n1) - int.parse(n2)).toString();

      } catch(e) {
        resultado= 'erro ta maluco';
      }
    } else if (resultado.contains('x')) {
      try{
      
           resultado = (int.parse(n1) * int.parse(n2)).toString();
      } catch(e) {
        resultado= 'erro ta maluco'; 
      } 
        
    } else if (resultado.contains('/')) {
      try{
              resultado = (int.parse(n1) / int.parse(n2)).toString();

      }catch(e) {
        resultado= 'erro ta maluco';
      }
    } else if
      (resultado.contains('%')){
   resultado = ((double.parse(n1)) / 100).toString();      }
    }
  );
}

  seState() {
    if (resultado == '0') {
      resultado = '';
      if (resultado.contains('+') ||
          resultado.contains('-') ||
          resultado.contains('*') ||
          resultado.contains('%') ||
          resultado.contains('/')) {
        resultado = resultado.substring(0, resultado.length - 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Container(
              margin: EdgeInsets.all(10),
              height: 200,
              width: 2000,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 122, 122, 122),
                borderRadius: BorderRadius.circular(10),
              ),
              //o resultado do calculo tem que aparecer aquiii

              child: Text(
                resultado,
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Botao(
              texto: 'C',
              cor: Color.fromARGB(255, 243, 0, 0),
              callback: apagar,
            ),
            Botao(
                texto: '( )',
                cor: Color.fromARGB(255, 64, 65, 64),
                callback: atualizar),
            Botao(
                texto: '%',
                cor: Color.fromARGB(255, 64, 65, 64),
                callback: atualizar),
            Botao(
                texto: '/',
                cor: Color.fromARGB(255, 64, 65, 64),
                callback: atualizar),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Botao(
                texto: '7',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '8',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '9',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: 'x',
                cor: Color.fromARGB(255, 64, 65, 64),
                callback: atualizar),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Botao(
                texto: '4',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '5',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '6',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '-',
                cor: Color.fromARGB(255, 64, 65, 64),
                callback: atualizar),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Botao(
                texto: '1',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '2',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '3',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '+',
                cor: Color.fromARGB(255, 64, 65, 64),
                callback: atualizar),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Botao(
                texto: '+/-',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '0',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: ',',
                cor: Color.fromARGB(255, 109, 110, 109),
                callback: atualizar),
            Botao(
                texto: '=',
                cor: Color.fromARGB(255, 64, 65, 64),
                callback: calculo),
          ],
        ),
      ],
    );
  }
}
