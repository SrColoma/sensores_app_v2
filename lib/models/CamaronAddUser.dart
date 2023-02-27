// To parse this JSON data, do
//
//     final camaronAddUser = camaronAddUserFromJson(jsonString);

import 'dart:convert';

CamaronAddUser camaronAddUserFromJson(String str) => CamaronAddUser.fromJson(json.decode(str));

String camaronAddUserToJson(CamaronAddUser data) => json.encode(data.toJson());

class CamaronAddUser {
    CamaronAddUser({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronAddUser.fromJson(Map<String, dynamic> json) => CamaronAddUser(
        status: json["status"],
        body: Body.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "body": body.toJson(),
    };
}

class Body {
    Body({
        required this.id,
        required this.user,
        required this.password,
        required this.rol,
    });

    String id;
    String user;
    String password;
    String rol;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        user: json["user"],
        password: json["password"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "password": password,
        "rol": rol,
    };
}
