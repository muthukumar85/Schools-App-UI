import 'package:flutter/material.dart';
import 'package:schools/components/Appbar.dart';
import 'package:schools/constants/Theme.dart';
class LeaveStatus extends StatefulWidget {
  const LeaveStatus({Key? key}) : super(key: key);

  @override
  State<LeaveStatus> createState() => _LeaveStatusState();
}

class _LeaveStatusState extends State<LeaveStatus> {
  List<Map> items = [
    {"from_date":"09-07-2023" , "to_date":"09-07-2023" , "Session":"FN,AN" , "Status":false },
    {"from_date":"05-06-2023" , "to_date":"06-06-2023" , "Session":"FN,AN" , "Status":true}

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars('Leave Request Status'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                child: Card(
                  color: ArgonColors.primary,
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('From Date' , style: TextStyle( color: ArgonColors.white , fontSize: 16  , fontWeight: FontWeight.w500),),
                      ),
                      Padding(padding: EdgeInsets.all(8),
                          child:Text( 'To Date',
                            style: TextStyle( color: ArgonColors.white , fontSize: 16  , fontWeight: FontWeight.w500),)
                      ),
                      Padding(padding: EdgeInsets.all(8),
                          child:Text( 'Sessions',
                            style: TextStyle( color: ArgonColors.white , fontSize: 16  , fontWeight: FontWeight.w500),)
                      ),
                      Padding(padding: EdgeInsets.all(8),
                          child:Text( 'Status',
                            style: TextStyle( color: ArgonColors.white , fontSize: 16  , fontWeight: FontWeight.w500),)
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /1.38,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: items.map((e) => makestatustile(data: e,),).toList()

                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget makestatustile({required Map data}) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Card(

        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data['from_date'] , style: TextStyle( color: ArgonColors.text , fontSize: 16  , fontWeight: FontWeight.w500),),
            ),
            Padding(padding: EdgeInsets.all(8),
                child:Text( data['to_date'],
                  style: TextStyle( color: ArgonColors.text , fontSize: 16  , fontWeight: FontWeight.w500),)
            ),
            Padding(padding: EdgeInsets.all(8),
                child:Text( data['Session'],
                  style: TextStyle( color: ArgonColors.text , fontSize: 16  , fontWeight: FontWeight.w500),)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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

