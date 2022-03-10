import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttlelvl1/controllers/posts_controller.dart';
import 'package:fluttlelvl1/controllers/randon_controler.dart';
import 'package:fluttlelvl1/widgets/custom_buttom_widget.dart';

class PaginaUm extends StatefulWidget {
  const PaginaUm({Key? key}) : super(key: key);

  @override
  State<PaginaUm> createState() => _PaginaUmState();
}

class _PaginaUmState extends State<PaginaUm> {
  //ter acesso ao controller api

  final PostController _controller = PostController();
//ter acesso ao controller randon
  final RandonControler _randonControler = RandonControler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _randonControler.valorAleatorio,
              builder: (_, value, __) => Text(
                "Valor eh: $value",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            CustomButtonWidget(
              disable: false,
              onPressed: () => _randonControler.randon(),
              title: "Custom BTN",
              titleSize: 18,
            ),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: Listenable.merge(
                  [_controller.valorApi, _controller.inLoader]),
              builder: (_, __) => _controller.inLoader.value
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.valorApi.value.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(_controller.valorApi.value[index].title),
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            CustomButtonWidget(
              disable: false,
              onPressed: () => _controller.callAPI(),
              title: "Api BTN",
              titleSize: 18,
            ),
          ],
        ),
      )),
    );
  }
}
