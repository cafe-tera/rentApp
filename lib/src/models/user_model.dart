// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String id;
    String nombre;
    String apellido;
    String celular;
    int puntos;
    String imagen;

    User({
        this.id,
        this.nombre,
        this.apellido,
        this.celular,
        this.puntos,
        this.imagen,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        celular: json["celular"],
        puntos: json["puntos"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "celular": celular,
        "puntos": puntos,
        "imagen": imagen,
    };
}
