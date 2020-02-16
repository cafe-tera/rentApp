// To parse this JSON data, do
//
//     final notificacion = notificacionFromJson(jsonString);

import 'dart:convert';

Notificacion notificacionFromJson(String str) => Notificacion.fromJson(json.decode(str));

String notificacionToJson(Notificacion data) => json.encode(data.toJson());

class Notificacion {
    String titulo;
    String texto;
    DateTime timestamp;

    Notificacion({
        this.titulo,
        this.texto,
        this.timestamp,
    });

    factory Notificacion.fromJson(Map<String, dynamic> json) => Notificacion(
        titulo: json["Titulo"],
        texto: json["Texto"],
        timestamp: DateTime.parse(json["Timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "Titulo": titulo,
        "Texto": texto,
        "Timestamp": timestamp.toIso8601String(),
    };
}
