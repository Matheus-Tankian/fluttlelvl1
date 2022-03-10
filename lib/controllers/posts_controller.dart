import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:fluttlelvl1/models/post.dart';

class PostController {
  ValueNotifier<List<Post>> valorApi = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  callAPI() async {
    var client = http.Client();
    try {
      inLoader.value = true;
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      valorApi.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
      //didatica
      await Future.delayed(Duration(seconds: 2));
    } finally {
      client.close();
      inLoader.value = false;
    }
  }
}
