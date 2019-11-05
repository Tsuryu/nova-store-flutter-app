import 'package:flutter/material.dart';
import 'package:nova_store/src/models/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Nova store - Home'),
      ),
       body: Center(
        child: Text('Bienvenido ${user.username}')
      ),
    );
  }
}