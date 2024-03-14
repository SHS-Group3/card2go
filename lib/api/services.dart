import 'dart:convert';
import 'dart:io';

import 'package:card2go/models/booking_model.dart';
import 'package:card2go/pages/account_page.dart';
import 'package:card2go/views/destinations_view.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

String baseUrl = "http://10.0.2.2:8080";

class DestinationsService {
  static String endpoint = "/destinations";
  static Future<List<Destination>> getDestinations(
      // this is awful
      {int page = 1,
      required bool hotels}) async {
    Response response = await get(
        Uri.parse("${baseUrl}${endpoint}?page=${page}&hotels=${hotels}"));
    if (response.statusCode != HttpStatus.ok) {
      throw Exception("failed to retrieve pois");
    }
    List data = jsonDecode(response.body);

    List<Destination> pois = [];
    for (Map<String, dynamic> i in data) {
      pois.add(fromJson(i));
    }

    return pois;
  }

  static Destination fromJson(Map<String, dynamic> json) {
    var poi = Destination(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
        beds: json["beds"],
        isLodging: json["is_lodging"],
        ratings: (json["ratings"] is int)
            ? (json["ratings"] as int).toDouble()
            : json["ratings"],
        rooms: json["rooms"],
        imageUrl: "https://picsum.photos/200/300.jpg?random=${json["name"]}",
        packages: (json["packages"] as List<dynamic>)
            .map((e) => Package(
                id: e["id"],
                title: e["title"],
                description: e["description"],
                price: (e["price"] is int)
                    ? (e["price"] as int).toDouble()
                    : e["price"]))
            .toList());

    return poi;
  }
}

class AuthService {
  static String endpoint = "/auth";
  static String registerEndpoint = "/register";
  static String?
      token; // don't want to deal with storing this somewhere in the app for now

  //TODO: use futures properly
  static Future register(
      String username, String password, String email, String contact) async {
    Response response =
        await post(Uri.parse("${baseUrl}${endpoint}${registerEndpoint}"),
            body: jsonEncode({
              "username": username,
              "password": password,
              "email": email,
              "contact_number": contact
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

class BookingService {
  static String endpoint = "/bookings";

  static Future<List<Booking>> getBookings() async {
    Response response = await get(Uri.parse("${baseUrl}${endpoint}"), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${AuthService.token}",
    });
    if (response.statusCode != HttpStatus.ok) {
      throw Exception("failed to retrieve bookings");
    }
    List data = jsonDecode(response.body);

    List<Booking> bookings = [];
    for (Map<String, dynamic> i in data) {
      bookings.add(fromJson(i));
    }

    return bookings;
  }

  static Future<int> book(
      int id, int? package, DateTime time, int tickets) async {
    Response response = await post(
        Uri.parse("$baseUrl${DestinationsService.endpoint}/${id}/book" +
            (package != null ? "/${package}" : "")),
        body: jsonEncode({
          "on": DateFormat("yyyy-MM-ddTHH:mm:ss+08:06").format(time),
          "tickets": tickets,
        }),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${AuthService.token}",
          HttpHeaders.contentTypeHeader: "application/json",
        });

    if (response.statusCode != HttpStatus.created) {
      throw Exception(jsonDecode(response.body)["error"]);
    }
    Map<String, dynamic> result = jsonDecode(response.body);
    return result["id"];
  }

  static Future cancel(Booking booking) async {
    Response response =
        await delete(Uri.parse("$baseUrl$endpoint/${booking.id}"), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${AuthService.token}",
    });

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(jsonDecode(response.body)["error"]);
    }
  }

  static Booking fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json["destination"];
    Map<String, dynamic>? pkg = json["package"];
    return Booking(
        created: DateTime.now(),
        on: DateTime.parse(json["on"]),
        id: json["id"],
        destination: DestinationData(
          id: data["id"],
          name: data["name"],
          description: data["description"],
        ),
        package: pkg != null
            ? Package(
                id: pkg["id"],
                title: pkg["title"],
                description: pkg["description"],
                price: (pkg["price"] is int)
                    ? (pkg["price"] as int).toDouble()
                    : pkg["price"],
              )
            : null,
        tickets: json["tickets"]);
  }
}

class UserService {
  static final String endpoint = "/user";

  static Future<User> getUser() async {
    Response response = await get(Uri.parse("${baseUrl}${endpoint}"), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${AuthService.token}",
    });
    if (response.statusCode != HttpStatus.ok) {
      throw Exception("failed to retrieve user data");
    }
    User user = fromJson(jsonDecode(response.body));

    return user;
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
        username: json["username"],
        contactNumber: json["contact_number"],
        email: json["email"]);
  }
}
