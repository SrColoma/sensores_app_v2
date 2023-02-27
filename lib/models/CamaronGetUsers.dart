// To parse this JSON data, do
//
//     final camaronGetUsers = camaronGetUsersFromJson(jsonString);

import 'dart:convert';

CamaronGetUsers camaronGetUsersFromJson(String str) => CamaronGetUsers.fromJson(json.decode(str));

String camaronGetUsersToJson(CamaronGetUsers data) => json.encode(data.toJson());

class CamaronGetUsers {
    CamaronGetUsers({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronGetUsers.fromJson(Map<String, dynamic> json) => CamaronGetUsers(
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
        required this.items,
        required this.count,
        required this.scannedCount,
    });

    List<Item> items;
    int count;
    int scannedCount;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
        count: json["Count"],
        scannedCount: json["ScannedCount"],
    );

    Map<String, dynamic> toJson() => {
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
        "Count": count,
        "ScannedCount": scannedCount,
    };
}

class Item {
    Item({
        required this.user,
        required this.password,
        required this.id,
        required this.rol,
    });

    String user;
    String password;
    String id;
    String rol;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        user: json["user"],
        password: json["password"],
        id: json["id"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "password": password,
        "id": id,
        "rol": rol,
    };
}
