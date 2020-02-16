// To parse this JSON data, do
//
//     final contacto = contactoFromJson(jsonString);

import 'dart:convert';

Contacto contactoFromJson(String str) => Contacto.fromJson(json.decode(str));

String contactoToJson(Contacto data) => json.encode(data.toJson());

class Contacto {
    String nombres;
    String apellidos;
    int id;
    String imagen;
    int puntos;

    Contacto({
        this.nombres,
        this.apellidos,
        this.id,
        this.imagen,
        this.puntos,
    });

    factory Contacto.fromJson(Map<String, dynamic> json) => Contacto(
        nombres: json["Nombres"],
        apellidos: json["Apellidos"],
        id: json["id"],
        imagen: json["Imagen"],
        puntos: json["Puntos"],
    );

    Map<String, dynamic> toJson() => {
        "Nombres": nombres,
        "Apellidos": apellidos,
        "id": id,
        "Imagen": imagen,
        "Puntos": puntos,
    };
}
