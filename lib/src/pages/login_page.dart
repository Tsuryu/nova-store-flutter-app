import 'package:flutter/material.dart';
import 'package:nova_store/src/models/user.dart';
import 'package:nova_store/src/providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserProvider userProvider = new UserProvider();
  String _username = '';
  String _password = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova store'),
        backgroundColor: Colors.black87,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
        children: <Widget>[
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Login', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black87)),
          //   ],
          // ),
          SizedBox(height: 20.0),            
          _crearInput(),
          SizedBox(height: 10.0),  
          _crearPassword(),
          SizedBox(height: 10.0),  
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50.0,
                  child: FlatButton(
                    color: Colors.black54,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                    child: Text('Register', style: TextStyle(color: Colors.white),),
                    onPressed: () => Navigator.pushNamed(context, 'register'),
                  ),
                ),
              ),
              SizedBox(width: 10.0),  
              Expanded(
                child: Container(
                  height: 50.0,
                  child: FlatButton(
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                    child: Text('Login', style: TextStyle(color: Colors.white),),
                    onPressed: () async {
                      User user = await userProvider.login(_username, _password);
                      if(user != null)
                        return Navigator.pushNamed(context, 'home', arguments: user);
                    },
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: 'Usuario',
        labelStyle: TextStyle(color: Colors.black87),
        suffixIcon: Icon( Icons.accessibility, color: Colors.black87, ),
        icon: Icon(Icons.account_circle, color: Colors.black87),
      ),
      onChanged: (value){
        setState(() {
          _username = value;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87),
        ),
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.black87),
        suffixIcon: Icon( Icons.lock_open, color: Colors.black87 ),
        icon: Icon(Icons.lock, color: Colors.black87),
      ),
      onChanged: (value) => setState(() {
        _password = value;
      }),
    );
  }
}