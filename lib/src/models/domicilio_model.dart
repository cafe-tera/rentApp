// To parse this JSON data, do
//
//     final domicilio = domicilioFromJson(jsonString);

import 'dart:convert';

Domicilio domicilioFromJson(String str) => Domicilio.fromJson(json.decode(str));

String domicilioToJson(Domicilio data) => json.encode(data.toJson());

class Domicilio {
    int id;
    String tipo;
    String texto;
    String imagen;
    String estado;
    int puntos;
    bool favorito;
    List<Comentario> comentarios;

    Domicilio({
        this.id,
        this.tipo,
        this.texto,
        this.imagen,
        this.estado,
        this.puntos,
        this.favorito,
        this.comentarios,
    });

    factory Domicilio.fromJson(Map<String, dynamic> json) => Domicilio(
        id: json["id"],
        tipo: json["Tipo"],
        texto: json["Texto"],
        imagen: json["Imagen"],
        estado: json["Estado"],
        puntos: json["Puntos"],
        favorito: json["Favorito"],
        comentarios: List<Comentario>.from(json["Comentarios"].map((x) => Comentario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Tipo": tipo,
        "Texto": texto,
        "Imagen": imagen,
        "Estado": estado,
        "Puntos": puntos,
        "Favorito": favorito,
        "Comentarios": List<dynamic>.from(comentarios.map((x) => x.toJson())),
    };
}

class Comentario {
    String nombres;
    String apellidos;
    String imagen;
    String comentario;

    Comentario({
        this.nombres,
        this.apellidos,
        this.imagen,
        this.comentario,
    });

    factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        nombres: json["Nombres"],
        apellidos: json["Apellidos"],
        imagen: json["Imagen"],
        comentario: json["Comentario"],
    );

    Map<String, dynamic> toJson() => {
        "Nombres": nombres,
        "Apellidos": apellidos,
        "Imagen": imagen,
        "Comentario": comentario,
    };
}
