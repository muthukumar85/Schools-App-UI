import 'package:flutter/material.dart';
import 'package:schools/components/Appbar.dart';
import 'package:schools/constants/Theme.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceDetail extends StatefulWidget {
  const AttendanceDetail({Key? key}) : super(key: key);

  @override
  State<AttendanceDetail> createState() => _AttendanceDetailState();
}

class _AttendanceDetailState extends State<AttendanceDetail> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  Map<DateTime, List<String>> _events = {
    DateTime(2023, 7, 1): ['Event 1'],
    DateTime(2023, 7, 2): ['Event 2', 'Event 3'],
    DateTime(2023, 7, 5): ['Event 4'],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars('Attendance Report'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //first card
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10 , top: 15),
              child: Container(
                height: 150,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: ArgonColors.primary,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8) , topRight: Radius.circular(8)  )
                      ),

                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10 , bottom: 10),
                        child: Text('July 2023' , style: TextStyle(color: ArgonColors.white , fontSize: 20 , fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                         padding: const EdgeInsets.only(left:15.0 , top: 8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0),
                               child: Text('Working Days' ,
                               style: TextStyle(color: ArgonColors.primary  , fontSize: 15 , fontFamily: 'OpenSans' , fontWeight: FontWeight.w700),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 12.0),
                               child: Text('31' ,
                               style: TextStyle(color: ArgonColors.text , fontSize: 16 , fontWeight: FontWeight.w900),
                               ),
                             )

                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0 , top: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Present Days' ,
                                  style: TextStyle(color: ArgonColors.primary  , fontSize: 15 , fontFamily: 'OpenSans' , fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text('28' ,
                                  style: TextStyle(color: ArgonColors.success , fontSize: 16 , fontWeight: FontWeight.w900),
                                ),
                              )

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0 , top: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Absent Days' ,
                                  style: TextStyle(color: ArgonColors.primary  , fontSize: 15 , fontFamily: 'OpenSans' , fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text('3' ,
                                  style: TextStyle(color: ArgonColors.error , fontSize: 18 , fontWeight: FontWeight.w700),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: ArgonColors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2.2,
                        offset: Offset(1, 4), // changes the position of the shadow
                      ),
                    ]
                ),
              ),
            ),
            // calendar
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ArgonColors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2.2,
                            offset: Offset(1, 4), // changes the position of the shadow
                          ),
                        ]
                    ),
                    child: Column(
                      children: [
                        TableCalendar(
                          firstDay: DateTime(2023),
                          lastDay: DateTime(2024),
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          },
                          headerStyle: HeaderStyle(
                            headerPadding: EdgeInsets.symmetric(vertical: 4),
                            leftChevronIcon: Icon(Icons.chevron_left , color: ArgonColors.white,size: 25,),
                            rightChevronIcon: Icon(Icons.chevron_right , color: ArgonColors.white,size: 25,),
                            titleTextStyle: TextStyle(color: ArgonColors.white , fontFamily: 'OpenSans' , fontSize: 20 , fontWeight: FontWeight.bold),
                            formatButtonVisible: false,
                            titleCentered: true,
                            decoration: BoxDecoration(
                              color: ArgonColors.primary,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8) , topRight: Radius.circular(8)  )
                            )
                          ),
                          calendarStyle: CalendarStyle(
                            tablePadding: EdgeInsets.only(top: 8)
                          ),
                          // onFormatChanged: (format) {
                          //   setState(() {
                          //     _calendarFormat = format;
                          //   });
                          // },
                          // eventLoader: (day) {
                          //   return _events[day] as List<dynamic>? ?? [];
                          // },
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 15 , top: 15  , bottom: 15),
                            child: Icon(Icons.check , color: ArgonColors.success,size: 30,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Present' , style: TextStyle(color: ArgonColors.success , fontSize: 18 , fontFamily: 'OpenSans' , fontWeight: FontWeight.w700 ),),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Expanded(
                //   child: _buildEventList(),
                // ),
              ],
            ),
            // last card
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10  , bottom: 30),
              child: Container(
                height: 150,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: ArgonColors.primary,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8) , topRight: Radius.circular(8)  )
                      ),

                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10 , bottom: 10),
                        child: Text('Overall Attendance' , style: TextStyle(color: ArgonColors.white , fontSize: 20 , fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:15.0 , top: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Working Days' ,
                                  style: TextStyle(color: ArgonColors.primary  , fontSize: 15 , fontFamily: 'OpenSans' , fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text('31' ,
                                  style: TextStyle(color: ArgonColors.text , fontSize: 16 , fontWeight: FontWeight.w900),
                                ),
                              )

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0 , top: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Present Days' ,
                                  style: TextStyle(color: ArgonColors.primary  , fontSize: 15 , fontFamily: 'OpenSans' , fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text('28' ,
                                  style: TextStyle(color: ArgonColors.success , fontSize: 16 , fontWeight: FontWeight.w900),
                                ),
                              )

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0 , top: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Absent Days' ,
                                  style: TextStyle(color: ArgonColors.primary  , fontSize: 15 , fontFamily: 'OpenSans' , fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text('3' ,
                                  style: TextStyle(color: ArgonColors.error , fontSize: 18 , fontWeight: FontWeight.w700),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: ArgonColors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2.2,
                        offset: Offset(1, 4), // changes the position of the shadow
                      ),
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
