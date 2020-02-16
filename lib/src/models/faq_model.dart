// To parse this JSON data, do
//
//     final faq = faqFromJson(jsonString);

import 'dart:convert';

Faq faqFromJson(String str) => Faq.fromJson(json.decode(str));

String faqToJson(Faq data) => json.encode(data.toJson());

class Faq {
    String pregunta;
    String respuesta;

    Faq({
        this.pregunta,
        this.respuesta,
    });

    factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        pregunta: json["Pregunta"],
        respuesta: json["Respuesta"],
    );

    Map<String, dynamic> toJson() => {
        "Pregunta": pregunta,
        "Respuesta": respuesta,
    };
}
