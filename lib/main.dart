import 'package:flutter/material.dart';
import 'package:fluttlelvl1/gerenciamento_de_estado/pagina_um.dart';
import 'package:fluttlelvl1/rotas/onePage.dart';
import 'package:fluttlelvl1/rotas/towPage.dart';
//import 'package:fluttlelvl1/todoList/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const PaginaUm(),
      // initialRoute: '/onePage',

      // routes: {
      //   '/onePage': (_) => const OnePage(),
      //   '/twoPage': (_) => const TwoPage(),
      // },
    );
  }
}
