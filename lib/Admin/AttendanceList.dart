import 'package:flutter/material.dart';
import 'package:schools/Admin/AttendanceDetail.dart';
import 'package:schools/components/Appbar.dart';
import 'package:schools/components/Navbar.dart';
import 'package:schools/constants/Theme.dart';
class AttendanceList extends StatefulWidget {
   AttendanceList({Key? key , required this.isAdmin}) : super(key: key);
  final bool isAdmin;
  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  final List<Student> students = [
    Student('John Doe', 21, 'Computer Science'),
    Student('Jane Smith', 20, 'Business Administration'),
    Student('David Johnson', 22, 'Electrical Engineering'),
    // Add more student objects here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars('Student List'),
      drawer: Navbar(isAdmin: widget.isAdmin),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left:8.0 , top: 8 , right: 8),
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (
                        BuildContext context) => AttendanceDetail())
                );
              },
              child: Card(
                child: ListTile(
                  title: Text(students[index].name , style: TextStyle(color: ArgonColors.text , fontFamily: 'OpenSans'),),
                  subtitle: Text('Roll no: ${students[index].age}, Class: ${students[index].major}' , style: TextStyle(color: ArgonColors.text , fontFamily: 'OpenSans'
                  ),),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Student {
  final String name;
  final int age;
  final String major;

  Student(this.name, this.age, this.major);
}