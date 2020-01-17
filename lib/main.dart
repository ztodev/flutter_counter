import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'counter.dart'; // Import the Counter

final counter = Counter(); // Instantiate the store

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contagem de cliques:',
            ),
            // Wrapping in the Observer will automatically re-render on changes to counter.value
            Observer(
              builder: (_) => Text(
                    '${counter.value}',
                    style: Theme.of(context).textTheme.display1,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: new EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,            
              child: FloatingActionButton(
                      onPressed: counter.reset,
                      tooltip: 'Resetar',
                      child: Icon(Icons.delete),
                    ),
            ),
            Spacer(
              flex: 1,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                      onPressed: counter.increment,
                      tooltip: 'Incrementar',
                      child: Icon(Icons.add),
                    ),
            )
          ],
        ),
      ),
    );
  }
}