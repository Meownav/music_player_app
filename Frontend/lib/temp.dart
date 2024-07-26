import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  var song = "ku bhagyan";
  var url = Uri.parse('https://saavn.dev/api/search?query=$song');
  var response = await http.get(url);

  jsonDecode((jsonDecode(response.body))['']);
}
