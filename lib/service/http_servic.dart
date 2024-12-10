import 'dart:convert';

import 'package:api/service/Post.dart';
import 'package:http/http.dart';

class Network {
  static String BASE = "jsonplaceholder.typicode.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/jon; charset=UTF-8'
  };

/*Http Apis */
  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts"; //{id}
  static String API_DELETE = "/posts"; //{id}

/*Http Repuests*/
  static Future<String?> GET(String api, Map<String, String> paeams) async {
    var uri = Uri.https(BASE, api, paeams);
    var response = await get(
      uri,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> paeams) async {
    var uri = Uri.https(
      BASE,
      api,
    );
    var response = await post(uri, headers: headers, body: jsonEncode(paeams));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> paeams) async {
    var uri = Uri.https(
      BASE,
      api,
    );
    var response = await put(uri, headers: headers, body: jsonEncode(paeams));
    if (response.statusCode == 200 || response.statusCode == 202) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> paeams) async {
    var uri = Uri.https(BASE, api, paeams);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /*Http Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString()
    });
    return params;
  }

/*Http Parsing  */

  static List<Post> parsrPostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}
