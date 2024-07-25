import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse('https://saavn.dev/api/search?query=Imagine+Dragons');
  var response = await http.get(url);
  print(response.statusCode);
  print(response.body);
}
