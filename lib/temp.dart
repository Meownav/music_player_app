// ignore_for_file: unused_import

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var album = "Charm";
  var url =
      Uri.parse("https://saavn.dev/api/search/albums?query=$album&limit=5");
  // ignore: unused_local_variable
  var response = await http.get(url);

  print(jsonDecode(response.body)["data"].keys);
  var data = jsonDecode(response.body)["data"];
  var results = data["results"];
  print(results[0]["name"]);
  // for (var key in results[0].keys.toList()) {
  //   print("$key: ${results[0][key]}");
  // }
  // print(results[0]["image"]);
  // print(results[0].keys);
  // print(results[0].runtimeType);
  // print(results[0]);
  // results.forEach((e) => print(e[0]));
}
