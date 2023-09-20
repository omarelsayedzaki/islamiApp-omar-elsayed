import 'package:flutter/material.dart';

import '../../HadethDetalis/HadethDetalisScreen.dart';
import 'Hadeth.dart';

class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetalisScreen.routeName, arguments: hadeth);
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            hadeth.title,
            style: TextStyle(fontSize: 24, color: Colors.black),
          )),
    );
  }
}
