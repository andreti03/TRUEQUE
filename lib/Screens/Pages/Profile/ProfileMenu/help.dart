import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class Help extends StatefulWidget {
  @override
  HelpState createState() => HelpState();
}

class HelpState extends State<Help> {

  @override
  void initState() {
    super.initState();
  }

  List<String> createList(){
    List<String> pdfList = [];
    for(int i=1; i<=20;i++){
      if (i <= 9){
        pdfList.add('assets/pdf/mypdf_page-000$i.png');
      }
      else{
        pdfList.add('assets/pdf/mypdf_page-00$i.png');
      }
    }
    return pdfList;
  }

  @override
  Widget build(BuildContext context) {
    List<String> pdfList = createList();
    return 
          Column(
            children: [
              Expanded(
              child: SizedBox(
                height: 200.0,
                child: new ListView.builder(
                  itemCount: pdfList.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new Image(image: AssetImage(pdfList[index]));
                  },
                ),
              ),
        ),
            ],
          );
    
  }
}