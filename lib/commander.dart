import 'package:flutter/material.dart';
import 'package:managetoner/theme.dart';

class CommanderPage extends StatefulWidget {


  @override
  _CommanderPageState createState() => _CommanderPageState();
}

class _CommanderPageState extends State<CommanderPage> {

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.pageBackgroundColor,
        body: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Assurance \n Véhicule',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'avenir', fontSize: 17, color: Colors.black),
                    ),
                    SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Colors.red
                        ),
                      ),
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextButton(
                      onPressed: _incrementCounter,
                      child: const Icon(Icons.add),
                    )
                  ]
              ),
            ]
        )
    );
  }
}
