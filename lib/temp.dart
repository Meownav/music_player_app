// ignore_for_file: unused_import,unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var album = "Kiss land";
  var url =
      Uri.parse("https://saavn.dev/api/search/albums?query=$album&limit=1");

  var response = await http.get(url);

  var data = jsonDecode(response.body)["data"];
  var results = data["results"];
  // print(results[0].keys);
  for (var key in results[0].keys.toList()) {
    print(key);
  }
  print("__________");
  // for (var key in results[0].keys.toList()) {
  //   print("$key : ${results[0][key]}");
  // }
}
