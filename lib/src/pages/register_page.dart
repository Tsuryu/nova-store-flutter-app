import 'package:flutter/material.dart';
import 'package:nova_store/src/models/user.dart';
import 'package:nova_store/src/providers/user_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final dniController = TextEditingController();
  final direccionController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final celularController = TextEditingController();
  final UserProvider userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova store - Register'),
        backgroundColor: Colors.black87,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Account info', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ],
          ), 
          SizedBox(height: 10.0),
          _crearInput(
            suffixIcon: Icon( Icons.accessibility, color: Colors.black87, ),
            leadingIcon: Icon(Icons.account_circle, color: Colors.black87),
            label: 'Username',
            controller: usernameController,
          ),
          SizedBox(height: 10.0),
          _crearPassword(controller: passwordController),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Personal data', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ],
          ),  
          SizedBox(height: 10.0),
          _crearInput(
            label: 'Name',
            controller: nombreController,
          ),
          SizedBox(height: 10.0),
          _crearInput(
            label: 'Lastname',
            controller: apellidoController,
          ),
          SizedBox(height: 10.0),
          _crearInput(
            label: 'Document number',
            controller: dniController,
          ),
          SizedBox(height: 10.0),
          _crearInput(
            label: 'Cellphone',
            controller: celularController,
          ),
          SizedBox(height: 10.0),
          _crearInput(
            label: 'Address',
            controller: direccionController,
          ),
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
                    child: Text('Back', style: TextStyle(color: Colors.white),),
                    onPressed: () => Navigator.pop(context),
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
                    child: Text('Accept', style: TextStyle(color: Colors.white),),
                    onPressed: () async {
                      bool resultado = await userProvider.signUp(User(
                        apellido: apellidoController.text,
                        nombre: nombreController.text,
                        celular: celularController.text,
                        direccion: direccionController.text,
                        dni: dniController.text,
                        password: passwordController.text,
                        username: usernameController.text
                      ));
                      print('El resultado fue $resultado');
                      if(resultado) Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0), 
        ],
      ),
    );
  }

   Widget _crearInput({Icon suffixIcon, Icon leadingIcon, String label, TextEditingController controller }) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: label,
        labelStyle: TextStyle(color: Colors.black87),
        suffixIcon: suffixIcon,
        icon: leadingIcon
      ),
    );
  }

  Widget _crearPassword({TextEditingController controller}) {
    return TextField(
      controller: controller,
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
    );
  }
}