import 'package:flutter/material.dart';
import 'package:schools/components/Appbar.dart';
import 'package:schools/constants/Theme.dart';

import 'package:intl/intl.dart';
class LeaveRequestForm extends StatefulWidget {
  @override
  _LeaveRequestFormState createState() => _LeaveRequestFormState();
}

class _LeaveRequestFormState extends State<LeaveRequestForm> {
  final GlobalKey<FormState> _formKeyleave = GlobalKey();

  late DateTime fromDate ;
  late DateTime toDate;
  String fromSession = 'FN' ;
  String toSession = 'AN';
  String description = '';

  List<String> sessions = [
    'FN',
    'AN'
  ];
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  TextEditingController myController3 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        'Leave Request',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Card(
              elevation: 4,
              child: Form(
                key: _formKeyleave,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(bottom: 15.0),
                        child:  Text('Leave Request Form',
                          style: TextStyle(
                              color: ArgonColors.primary,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                              fontFamily: 'OpenSans'
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: myController1,
                        readOnly: true,
                        // initialValue: fromDate.toString(),
                        decoration: const InputDecoration(
                          // filled:true,

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 1.8,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 2.0,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: ArgonColors.primary,

                            ),
                            labelText: 'From Date',
                            hoverColor: ArgonColors.primary
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
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
                              fromDate = pickedDate;
                              myController1.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                            });
                          }
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: myController2,
                        decoration: const InputDecoration(
                          // filled:true,

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 1.8,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 2.0,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: ArgonColors.primary,

                            ),
                            labelText: 'To Date',
                            hoverColor: ArgonColors.primary
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
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
                              toDate = pickedDate;
                              myController2.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                            });
                          }
                        },
                      ),
                      SizedBox(height: 16.0),
                      DropdownButtonFormField(

                        decoration: const InputDecoration(
                          // filled:true,

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 1.8,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 2.0,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: ArgonColors.primary,

                            ),
                            labelText: 'From Session',
                            hoverColor: ArgonColors.primary
                        ),
                        value: fromSession,
                        onChanged: (newValue) {
                          setState(() {
                            fromSession = newValue.toString();
                          });
                        },
                        items: sessions.map((session) {
                          return DropdownMenuItem(
                            value: session,
                            child: Text(session),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 16.0),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          // filled:true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 1.8,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 2.0,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: ArgonColors.primary,

                            ),
                            labelText: 'To Session',
                            hoverColor: ArgonColors.primary
                        ),
                        value: toSession,
                        onChanged: (newValue) {
                          setState(() {
                            toSession = newValue.toString();
                          });
                        },
                        items: sessions.map((session) {
                          return DropdownMenuItem(
                            value: session,
                            child: Text(session),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: myController3,
                        decoration: const InputDecoration(
                          // filled:true,

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 1.8,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: ArgonColors.primary,
                                width: 2.0,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: ArgonColors.primary,

                            ),
                            labelText: 'Description',
                            hoverColor: ArgonColors.primary
                        ),
                        onChanged: (value) {
                          setState(() {
                            description = value;
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 0, right: 0, top: 8),
                          child: RaisedButton(
                            textColor: ArgonColors.white,
                            color: ArgonColors.primary,
                            onPressed: (){},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 12, bottom: 12),
                                child: Text("SEND REQUEST",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 16.0))),
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


