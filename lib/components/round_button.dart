import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

class roundButton extends StatelessWidget {
  const roundButton({
    super.key,
    required this.mycolor,
    required this.nextPage,
    required this.label,
  });
  final Color mycolor;
  final String label;
  final VoidCallback nextPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: nextPage,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
