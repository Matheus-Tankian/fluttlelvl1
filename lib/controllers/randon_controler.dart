import 'dart:math';

import 'package:flutter/widgets.dart';

class RandonControler {
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);
  //dentro d eum controler
  randon() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));

      valorAleatorio.value = Random().nextInt(1000);
    }
  }
}
