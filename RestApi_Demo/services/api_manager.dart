import 'dart:convert';
import 'package:http/http.dart';
class ApiManager{

  final String url;
  ApiManager(this.url);

  Future getNews() async {

    Response response;
    var jsonResponse;
    print("url is: $url");
    response = await get(Uri.parse(url));
    if(response.statusCode==200){
      print('code: ${response.statusCode} ');
      jsonResponse = json.decode(response.body);
     // print(jsonResponse);
      return jsonResponse;
    }
    return jsonResponse;
  }
}