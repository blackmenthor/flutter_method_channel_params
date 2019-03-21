import 'package:flutter/material.dart';
import 'package:flutter_method_channel_params/bridge.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();

  int result;

  void calculateFromNative() async {
    int a = int.parse(controllerA.value.text);
    int b = int.parse(controllerB.value.text);
    int res = await NativeBridge.calculateWithNative(a, b);
    setState(() {
      this.result = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("A"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                controller: controllerA,
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Text("B"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                controller: controllerB,
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Text(
              'The result from native is',
            ),
            Text(
              "${result ?? '-'}",
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calculateFromNative,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
