import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  String _password;

  // PasswordWidget({@required this.passwordField});
  
  @override
  Widget build(BuildContext context) {
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
      onChanged: (valor) => 
      // setState(
        () {
          print('click $valor');
        _password = valor;
      }
      // )
      ,
    );
  }

  String get password{
    return _password;
  }
}