import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Hadeth.dart';
import 'HadethTitleWidget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) {
      loadHadethFile();
    }

    return Column(
      children: [
        Expanded(
            flex: 1, child: Image.asset('assets/images/ahadeth_image.png')),
        Container(
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      width: 2, color: Theme.of(context).primaryColor))),
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text("الاحاديث",
              style: TextStyle(color: Colors.black, fontSize: 24)),
        ),
        Expanded(
          flex: 3,
          child: allHadeth.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return HadethTitleWidget(allHadeth[index]);
                  },
                  separatorBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 48),
                        color: Theme.of(context).primaryColor,
                        width: double.infinity,
                        height: 2,
                      ),
                  itemCount: allHadeth.length),
        )
      ],
    );
  }

  List<Hadeth> allHadeth = [];

  void loadHadethFile() async {
    String fileContant =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = fileContant.trim().split("#");
    for (int i = 0; i < hadethList.length; i++) {
      String singleHadeth = hadethList[i];
      List<String> hadethLines = singleHadeth.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.remove(0);
      String content = hadethLines.join("\n");
      Hadeth hadeth = Hadeth(title, content);
      allHadeth.add(hadeth);
    }
    setState(() {});
  }
}
