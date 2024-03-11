import 'dart:convert';
import 'dart:io';

import 'package:card2go/views/destinations_view.dart';
import 'package:http/http.dart';

String baseUrl = "http://10.0.2.2:8080";

class POIs {
  static String endpoint = "/destinations";
  static Future<List<POI>> getPOIs({int page = 1}) async {
    Response response =
        await get(Uri.parse("${baseUrl}${endpoint}?page=${page}"));
    if (response.statusCode != HttpStatus.ok) {
      throw Exception("failed to retrieve pois");
    }
    List data = jsonDecode(response.body);

    List<POI> pois = [];
    for (Map<String, dynamic> i in data) {
      pois.add(fromJson(i));
    }

    return pois;
  }

  static POI fromJson(Map<String, dynamic> json) {
    var poi = POI(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
        imageUrl: "https://picsum.photos/200/300.jpg?random=${json["name"]}");
    return poi;
  }
}

class Authentication {
  static String endpoint = "/auth";
  static String registerEndpoint = "/register";
  static String?
      token; // don't want to deal with storing this somewhere in the app for now

  //TODO: use futures properly
  static Future register(String username, String password) async {
    Response response =
        await post(Uri.parse("${baseUrl}${endpoint}${registerEndpoint}"),
            body: jsonEncode({
              "username": username,
              "password": password,
            }),
            headers: {HttpHeaders.contentTypeHeader: "application/json"});
    if (response.statusCode != HttpStatus.created) {
      throw Exception(jsonDecode(response.body)["error"]);
    }
  }

  static Future authenticate(String username, String password) async {
    Response response = await post(Uri.parse("${baseUrl}${endpoint}"),
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    if (response.statusCode != HttpStatus.ok) {
      throw Exception(jsonDecode(response.body)["error"]);
    }
    Map<String, dynamic> result = jsonDecode(response.body);
    token = result["token"];
  }
}

class Bookings {
  static String endpoint = "/bookings";

  static Future<int> book(int id, int? package) async {
    Response response =
        await post(Uri.parse("$baseUrl${POIs.endpoint}/${id}/book"), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${Authentication.token}"
    });

    if (response.statusCode != HttpStatus.created) {
      throw Exception(jsonDecode(response.body)["error"]);
    }
    Map<String, dynamic> result = jsonDecode(response.body);
    return result["id"];
  }
}
