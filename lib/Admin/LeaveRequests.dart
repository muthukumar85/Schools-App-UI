import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schools/components/Navbar.dart';

import '../components/Appbar.dart';
import '../constants/Theme.dart';
class LeaveRequests extends StatefulWidget {
  const LeaveRequests({Key? key , required this.isAdmin}) : super(key: key);
  final bool isAdmin;
  @override
  State<LeaveRequests> createState() => _LeaveRequestsState();
}

class _LeaveRequestsState extends State<LeaveRequests> {
  DateTime _selectedDate = DateTime.now();
  List<Map> items = [
    {"name":"Muthu","from_date":"09-07-2023" , "to_date":"09-07-2023" , "Session":"FN,AN" , "Status":false },
    {"name":"Kumar","from_date":"05-06-2023" , "to_date":"06-06-2023" , "Session":"FN,AN" , "Status":true}

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars('Leave Requests'),
      drawer: Navbar(isAdmin: widget.isAdmin,),
      body: SingleChildScrollView(
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
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height /1.38,
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: items.map((e) => makerequesttiles(data: e,),).toList()

              ),
            ),
          ],
        ),
      ),
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
  Widget makepopup({required Map data}) => AlertDialog(
    title: Text('Leave Request' , style: TextStyle(color: ArgonColors.text),),
    content: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(
            maxHeight: 340
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name : ' ,
                    style: TextStyle(color: ArgonColors.primary , fontSize: 18 , fontWeight: FontWeight.w500),),
                  Text(data['name'] , style: TextStyle(color: ArgonColors.text , overflow: TextOverflow.ellipsis , fontSize: 18 , ),maxLines: 1,)
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('From Date : ' ,
                    style: TextStyle(color: ArgonColors.primary , fontSize: 18 , fontWeight: FontWeight.w500),),
                  Text(data['from_date'] , style: TextStyle(color: ArgonColors.text , overflow: TextOverflow.ellipsis , fontSize: 18 , ),maxLines: 1,)
                ],
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('To Date : ' ,
                    style: TextStyle(color: ArgonColors.primary , fontSize: 18 , fontWeight: FontWeight.w500),),
                  Text(data['to_date'] , style: TextStyle(color: ArgonColors.text , overflow: TextOverflow.ellipsis , fontSize: 18 , ),maxLines: 1,)
                ],
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text('Sessions : ' ,
                    style: TextStyle(color: ArgonColors.primary , fontSize: 18 , fontWeight: FontWeight.w500),),
                  Text(data['Session'] , style: TextStyle(color: ArgonColors.text , overflow: TextOverflow.ellipsis , fontSize: 18 , ),maxLines: 1,)
                ],
              ),Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description : ' ,
                    style: TextStyle(color: ArgonColors.primary , fontSize: 18 , fontWeight: FontWeight.w500),),
                  Text('Suffering from fever Suffering from feverSuffering from feverSuffering from fever' , style: TextStyle(color: ArgonColors.text  , fontSize: 18 , ),)
                ],
              ),
            ],
          ),
        )
    ),
    actions: [
      RaisedButton(
      color: ArgonColors.success,
      child: Text('Approve' , style: TextStyle(color: ArgonColors.white ),),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
      RaisedButton(
        color: ArgonColors.primary,
        child: Text('Close' , style: TextStyle(color: ArgonColors.white ),),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
  Widget makerequesttiles({required Map data}) => InkWell(
  onTap: ()
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return makepopup(data: data);
      },
    );
  },
  child: Container(

  height: 100, // Adjust the height according to your requirement

  margin: EdgeInsets.symmetric(horizontal: 8),

  child: Card(

  elevation: 4,

  shape: RoundedRectangleBorder(

      // borderRadius: BorderRadius.circular(8),

      ),

  child: Row(

  crossAxisAlignment: CrossAxisAlignment.center,

  children: [

  SizedBox(width: 15),

  Container(
  width: 38,
  height: 38,

  decoration:  BoxDecoration(

  borderRadius: BorderRadius.circular(20),
  color: ArgonColors.primary
  ),

  child: Center(child: Text('1' , style: TextStyle(color: ArgonColors.white , fontSize: 18),)),

  ),

  SizedBox(width: 16),

  Expanded(

  child: Column(

  mainAxisAlignment: MainAxisAlignment.center,

  crossAxisAlignment: CrossAxisAlignment.start,

  children: [

  Text(

  data['name'].toString(),

  style: TextStyle(
  color: ArgonColors.text,
  fontSize: 18,
  overflow: TextOverflow.fade,

  // fontWeight: FontWeight.bold,

  ),
  maxLines: 1,

  ),

  SizedBox(height: 8),

  Text(

  'request for leave',

  style: TextStyle(fontSize: 14 , color: ArgonColors.text , overflow: TextOverflow.ellipsis ,),maxLines: 1,

  ),

  ],

  ),

  ),

  SizedBox(width: 3),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          data['Status']?Icon(Icons.check , color: ArgonColors.success,):Icon(Icons.warning , color: ArgonColors.warning,),
          Padding(padding: EdgeInsets.all(2),
              child:Text( data['Status']?'Approved':'Pending',
                style: TextStyle( color: ArgonColors.text , fontSize: 14  , fontWeight: FontWeight.w500),)
          ),
        ],
      ),
    ),

  ],

  ),

  ),

  ),
  );
}
