import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop("Retorno");
                } //verifica se pode voltar para a pagina anterior

                //Navigator.of(context).pop("Retorno");//pra retorna pra a anterior
              },
              child: Text(
                "Pagina dois $args",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
