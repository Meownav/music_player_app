// // ignore_for_file: unused_import

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() async {
//   var album = "Not like us";
//   var url =
//       Uri.parse("https://saavn.dev/api/search/songs?query=$album&limit=1");
//   // ignore: unused_local_variable
//   var response = await http.get(url);

//   // print(jsonDecode(response.body)["data"].keys);
//   var data = jsonDecode(response.body)["data"];
//   var results = data["results"];
//   print(results[0]);
//   // for (var key in results[0].keys.toList()) {
//   //   print("$key: ${results[0][key]}");
//   // }
//   // print(results[0]["image"]);
//   // print(results[0].keys);
//   // print(results[0].runtimeType);
//   // print(results[0]);
//   // results.forEach((e) => print(e[0]));
// }
