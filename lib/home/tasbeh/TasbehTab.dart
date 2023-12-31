import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int count = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله  ",
    " الله اكبر"
  ];

  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/images/head_of_seb7a.png')),
        Center(
          child: AnimatedRotation(
            turns: turns,
            duration: Duration(milliseconds: 100),
            child:
                Center(child: Image.asset('assets/images/body_of_seb7a.png')),
          ),
        ),
        Center(
            child: Text(
          "عدد التسبيحات ",
          style: TextStyle(fontSize: 25),
        )),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).primaryColor,
          ),
          child: Text("$count"),
          width: 60,
          height: 60,
        ),
        InkWell(
          onTap: () {
            setState(() {
              count++;
              turns += 1 / 33;
            });
            if (count == 33) {
              count = 0;
              String deleted = azkar.removeAt(0);
              azkar.add(deleted);
            }
          },
          child: Container(
            margin: EdgeInsets.all(16),
            alignment: Alignment.center,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(azkar[0]),
            width: 200,
            height: 60,
          ),
        ),
      ],
    );
  }
}
