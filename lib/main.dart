import 'package:column_widget_flexible/box.dart';
import 'package:column_widget_flexible/panel.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _mainAxisAlignment = MainAxisAlignment.start;
  var _mainAxisSize = MainAxisSize.max;
  var _crossAxisAlignment = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: _mainAxisAlignment,
            mainAxisSize: _mainAxisSize,
            crossAxisAlignment: _crossAxisAlignment,
            children: [
              Box(color: Colors.blueAccent, text: '@', fontSize: 14),
              Box(color: Colors.redAccent, text: '@', fontSize: 24),
              Box(color: Colors.yellowAccent, text: '@', fontSize: 14),
            ],
            textBaseline: _crossAxisAlignment == CrossAxisAlignment.baseline
                ? TextBaseline.ideographic
                : null,
          ),
        ),
        bottomNavigationBar: Panel(
          initialMainAxisAlignment: MainAxisAlignment.start,
          initialMainAxisSize: MainAxisSize.max,
          initialCrossAxisAlignment: CrossAxisAlignment.center,
          onMainAxisAlignmentChanged: (i) => setState(() {
            _mainAxisAlignment = MainAxisAlignment.values[i];
          }),
          onMainAxisSizeChanged: (i) => setState(() {
            _mainAxisSize = MainAxisSize.values[i];
          }),
          onCrossAxisAlignmentChanged: (i) => setState(() {
            _crossAxisAlignment = CrossAxisAlignment.values[i];
          }),
        ),
      ),
    );
  }
}
