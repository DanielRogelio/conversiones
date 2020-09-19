import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Temeperatura',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversor(title: 'Convertidor de grados F° a C°'),
    );
  }
}

class Conversor extends StatefulWidget {
  Conversor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  var _output = 'Initial';
  final inputController = TextEditingController();

  void _calculateTemp(){
    setState(() {
      double temperatura_original = double.parse(inputController.text);
      double temperatura_salida = (temperatura_original - 32) * 5 / 9;
      _output = "$temperatura_salida";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor'),
      ),
        body: Center(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: inputController,
                ),
                RaisedButton(
                  onPressed: () {
                    _calculateTemp();
                  },
                ),
                Text(_output),
              ]
            ),
          ),
        ),
    );
  }
}
