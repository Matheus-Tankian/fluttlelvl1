import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttlelvl1/widgets/custom_buttom_widget.dart';

class PaginaUm extends StatefulWidget {
  const PaginaUm({Key? key}) : super(key: key);

  @override
  State<PaginaUm> createState() => _PaginaUmState();
}

class _PaginaUmState extends State<PaginaUm> {
  int valorAleatorio = 0;

  randon() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        valorAleatorio = Random().nextInt(1000);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Valor eh: $valorAleatorio",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          CustomButtonWidget(
            disable: false,
            onPressed: () => randon(),
            title: "Custom BTN",
            titleSize: 18,
          ),
        ],
      )),
    );
  }
}
