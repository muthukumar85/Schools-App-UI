import 'package:flutter/material.dart';
import 'package:schools/constants/Theme.dart';

class CommercialPopup extends StatefulWidget {
  const CommercialPopup({Key? key , required this.homework}) : super(key: key);
  final Map<dynamic,dynamic> homework;
  @override
  State<CommercialPopup> createState() => _CommercialPopupState();
}

class _CommercialPopupState extends State<CommercialPopup> {
  late Map<dynamic , dynamic> hwdata;
  late List<Widget> tiles = [];
  ListTile makeList({required String subject , required String homework}) =>
      ListTile(
        title: Text(subject , style: TextStyle(color: ArgonColors.text , fontWeight: FontWeight.bold),),
        subtitle: Text(homework , style: TextStyle(color: ArgonColors.text),),
      );

  @override
  void initState() {
    hwdata = widget.homework;
    hwdata.forEach((key, value) {
      setState(() {
        tiles.add(makeList(subject: key, homework: value));

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Tamil' , style: TextStyle(color: ArgonColors.text),),
      content: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(
          maxHeight: 300
        ),
        child: Text('Stay Positive in all situations , write tamil letters from அ to ஔ , write tamil letters from அ to ஔ' ,
          style: TextStyle(color: ArgonColors.text),)
      ),
      actions: [
        RaisedButton(
          color: ArgonColors.primary,
          child: Text('Close' , style: TextStyle(color: ArgonColors.white ),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
