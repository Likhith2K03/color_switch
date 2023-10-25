import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color currentColor = Colors.red;

  void changeColor(Color newColor) {
    setState(() {
      currentColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentColor,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircularColorButton(Colors.red, changeColor),
                CircularColorButton(Colors.blue, changeColor),
                CircularColorButton(Colors.green, changeColor),
                CircularColorButton(Colors.orange, changeColor),
                CircularColorButton(Colors.purple, changeColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircularColorButton extends StatelessWidget {
  final Color color;
  final Function(Color) onPressed;

  CircularColorButton(this.color, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(color),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
