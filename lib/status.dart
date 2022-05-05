import 'package:flutter/material.dart';
import 'package:managetoner/theme.dart';
import '../globals.dart' as globals;

class StatusPage extends StatefulWidget {


  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

    isFirstTime() async {
      bool? firstconnexion = globals.preferences.getBool("firstconnexion");
      if (firstconnexion == null) {

        globals.preferences.setBool("firstconnexion", false);
      }
    }
  late List<List<Map<String, List<dynamic>>>> stock;
  int _counter = 0;
  bool modifiable=false;
  void _inCounter() {
    setState(() {
      _counter++;
    });
  }
  void _deCounter() {
    setState(() {
      _counter--;
    });
  }
  @override
  void initState() {
    super.initState();
    modifiable=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
        title: Text('Status des Tonners'),
    ),
    actions: <Widget>[
        Switch(
          onChanged: (bool value) {
            setState(() {
              modifiable=true;
            });
          },
          value: modifiable,
          activeColor: Colors.blue,
          inactiveThumbColor: Colors.red,
        )
    ]
        ),
        backgroundColor: CustomColors.pageBackgroundColor,
        body: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Imprimante : HpLaserJet',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'avenir', fontSize: 17, color: Colors.black),
              ),
              Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'CF410XC',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'avenir', fontSize: 13, color: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () {
                        if(modifiable){
                          _deCounter;
                        }
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: (){
                        if(modifiable){
                          _inCounter;
                        }
                      },
                      child: const Icon(Icons.add),
                    )
                  ]
              ),
            ]
        )
    );
  }
}
