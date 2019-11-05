class User{
  String nombre;
  String apellido;
  String dni;
  String celular;
  String direccion;
  String username;
  String password;

  User({
    this.nombre,
    this.apellido,
    this.dni,
    this.celular,
    this.direccion,
    this.username,
    this.password
  });

  User.fromJsonMap(Map<String,dynamic> json){
    nombre = json['nombre'];
    apellido = json['apellido'];
    dni = json['dni'];
    celular = json['celular'];
    direccion = json['direccion'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() =>
    {
      'nombre': nombre,
      'apellido': apellido,
      'dni': dni,
      'celular': celular,
      'direccion': direccion,
      'username': username,
      'password': password
    };
}