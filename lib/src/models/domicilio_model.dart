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
    double puntos;
    bool favorito;
    List<Informacion> informacion;
    List<String> fotos;
    List<Comentario> comentarios;

    Domicilio({
        this.id,
        this.tipo,
        this.texto,
        this.imagen,
        this.estado,
        this.puntos,
        this.favorito,
        this.informacion,
        this.fotos,
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
        informacion: List<Informacion>.from(json["Informacion"].map((x) => Informacion.fromJson(x))),
        fotos: List<String>.from(json["Fotos"].map((x) => x)),
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
        "Informacion": List<dynamic>.from(informacion.map((x) => x.toJson())),
        "Fotos": List<dynamic>.from(fotos.map((x) => x)),
        "Comentarios": List<dynamic>.from(comentarios.map((x) => x.toJson())),
    };
}

class Comentario {
    String nombres;
    String apellidos;
    String imagen;
    double puntos;
    String comentario;

    Comentario({
        this.nombres,
        this.apellidos,
        this.imagen,
        this.puntos,
        this.comentario,
    });

    factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        nombres: json["Nombres"],
        apellidos: json["Apellidos"],
        imagen: json["Imagen"],
        puntos: json["Puntos"],
        comentario: json["Comentario"],
    );

    Map<String, dynamic> toJson() => {
        "Nombres": nombres,
        "Apellidos": apellidos,
        "Imagen": imagen,
        "Puntos": puntos,
        "Comentario": comentario,
    };
}

class Informacion {
    String nombre;
    dynamic data;

    Informacion({
        this.nombre,
        this.data,
    });

    factory Informacion.fromJson(Map<String, dynamic> json) => Informacion(
        nombre: json["nombre"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "data": data,
    };
}
