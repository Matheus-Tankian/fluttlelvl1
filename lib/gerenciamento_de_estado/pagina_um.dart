import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttlelvl1/widgets/custom_buttom_widget.dart';

class PaginaUm extends StatefulWidget {
  const PaginaUm({Key? key}) : super(key: key);

  @override
  State<PaginaUm> createState() => _PaginaUmState();
}

class _PaginaUmState extends State<PaginaUm> {
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);

  randon() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));

      valorAleatorio.value = Random().nextInt(1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
        ],
      )),
    );
  }
}
