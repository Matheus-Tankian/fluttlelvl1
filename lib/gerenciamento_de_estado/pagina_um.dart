import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttlelvl1/consumo_api/post.dart';
import 'package:fluttlelvl1/widgets/custom_buttom_widget.dart';
import 'package:http/http.dart' as http;

class PaginaUm extends StatefulWidget {
  const PaginaUm({Key? key}) : super(key: key);

  @override
  State<PaginaUm> createState() => _PaginaUmState();
}

class _PaginaUmState extends State<PaginaUm> {
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);
  ValueNotifier<List<Post>> valorApi = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  randon() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));

      valorAleatorio.value = Random().nextInt(1000);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: valorAleatorio,
              builder: (_, value, __) => Text(
                "Valor eh: $value",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            CustomButtonWidget(
              disable: false,
              onPressed: () => randon(),
              title: "Custom BTN",
              titleSize: 18,
            ),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: Listenable.merge([valorApi, inLoader]),
              builder: (_, __) => inLoader.value
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: valorApi.value.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(valorApi.value[index].title),
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            CustomButtonWidget(
              disable: false,
              onPressed: () => callAPI(),
              title: "Api BTN",
              titleSize: 18,
            ),
          ],
        ),
      )),
    );
  }
}
