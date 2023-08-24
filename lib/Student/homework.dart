import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schools/components/Appbar.dart';
import 'package:schools/components/HCard.dart';
import 'package:schools/components/Navbar.dart';
import 'package:schools/constants/Theme.dart';
import 'package:intl/intl.dart';
class homework extends StatefulWidget {
  const homework({Key? key}) : super(key: key);

  @override
  State<homework> createState() => _homeworkState();
}

class _homeworkState extends State<homework> {

  List<Map<dynamic,dynamic>> items = [
    {'Subject':'Tamil' , 'title':'Stay Positive in all situations , write tamil letters from அ to ஔ , write tamil letters from அ to ஔ' ,
      'homework':{'Tamil':'write tamil letters from அ to ஔ ' , 'English':'write english letters from A to Z , write english letters from A to Z , write english letters from A to Z' , 'Maths':'Write tables from 2 to 10' , 'science':' write five cells name ' , 'social':'write four country names start with letter R'} },
    {'Subject':'English' , 'title':'Stay Positive in all situations' , 'homework':{'Tamil':'write tamil letters from அ to ஔ ' , 'English':'write english letters from A to Z'}},
    {'Subject':'Maths' , 'title':'Stay Positive in all situations' , 'homework':{'Tamil':'write tamil letters from அ to ஔ ' , 'English':'write english letters from A to Z'}},
    {'Subject':'Science' , 'title':'Stay Positive in all situations' , 'homework':{'Tamil':'write tamil letters from அ to ஔ ' , 'English':'write english letters from A to Z'}},
    {'Subject':'Social' , 'title':'Stay Positive in all situations' , 'homework':{'Tamil':'write tamil letters from அ to ஔ ' , 'English':'write english letters from A to Z'}},
    {'Subject':'Computer Science' , 'title':'Stay Positive in all situations' , 'homework':{'Tamil':'write tamil letters from அ to ஔ ' , 'English':'write english letters from A to Z'}},
    {'Subject':'Web Dev' , 'title':'Stay Positive in all situations' , 'homework':{'Tamil':'write tamil letters from அ to ஔ ' , 'English':'write english letters from A to Z'}},


  ];
  List<Widget> Hcards = [];
  DateTime _selectedDate = DateTime.now();
  @override
  void initState() {
    setState(() {
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars('Home Work'),
      drawer: Navbar( isAdmin: false,),
      body:
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 60,
                  child: Card(
                    color: ArgonColors.primary,
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(width: 30,),
                        ),
                        Padding(padding: EdgeInsets.all(8),
                        child:Text(_selectedDate == null
                            ? 'No date selected'
                            : DateFormat('dd-MM-yyyy').format(_selectedDate) , style: TextStyle( color: ArgonColors.white , fontSize: 18  , fontWeight: FontWeight.w700),)
                        ),
                        Padding(padding: EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: _showDatePicker, icon: Icon(Icons.calendar_month_outlined , color: ArgonColors.white,), // Call the method to show the date picker
                        ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /1.38,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                      children: items.map((e) => makeHcards(data: e,),).toList()

          ),
                ),
              ],
            ),
      ),
    ]
          ),
        )
    );
  }
  void _showDatePicker()  async{
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
      currentDate: _selectedDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: ArgonColors.primary, // Change the header background color
            accentColor: ArgonColors.primary, // Change the selection color
            colorScheme: ColorScheme.light(
              primary: ArgonColors.primary, // Change the text color
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary, // Change the button text color
            ),
          ),
          child: child as Widget,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
