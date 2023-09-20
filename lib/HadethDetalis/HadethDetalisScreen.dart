import 'package:flutter/material.dart';

import '../home/hadeth/Hadeth.dart';

class HadethDetalisScreen extends StatelessWidget {
  static const String routeName = 'Hadeth-detalis';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/main_background.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(args.title),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Card(
                  child: SingleChildScrollView(
                    child: Text(args.contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
                ),
              ),
            ],
          )),
    );
  }
}
