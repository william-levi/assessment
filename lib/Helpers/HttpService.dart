

import 'package:edamama_test/Common/HttpServiceData.dart';
import 'package:http/http.dart';
class HttpService {
  String baseUrl = HttpServiceData.API_URL;

  Future<String> getRequest(String endpoint) async
  {
    Response response = await get(Uri.parse(baseUrl + endpoint));
    if (response.statusCode == 200)
    {
      return response.body.toString();
    }
    else
      throw "Connection Error";
  }
}