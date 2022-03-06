import 'package:flutter/material.dart';

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      //.pushNamed('/twoPage', arguments: "teste")
                      .pushReplacementNamed('/twoPage',
                          arguments:
                              "teste") //colocar por cima e remover a anterior
                      .then(
                        (value) => print(value),
                      );
                },
                child: const Text(
                  "Pagina um",
                )),
          ),
        ],
      ),
    );
  }
}
