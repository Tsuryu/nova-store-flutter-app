import 'package:flutter/material.dart';
import 'package:nova_store/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Nova store'),
      //   ),
      //   body: Center(
      //     child: Container(
      //       child: Text('Hello World'),
      //     ),
      //   ),
      // ),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        print('ruta llamada: ${settings.name}');
        return MaterialPageRoute(
          // builder: (BuildContext context) => AlertPage()
        );
      },
    );
  }
}