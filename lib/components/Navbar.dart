import 'package:flutter/material.dart';
import 'package:schools/Admin/AttendanceDetail.dart';
import 'package:schools/Admin/AttendanceList.dart';
import 'package:schools/Admin/LeaveRequests.dart';
import 'package:schools/Pages/home.dart';
import 'package:schools/Pages/loginhome.dart';
import 'package:schools/Student/LeaveStatus.dart';
import 'package:schools/Student/NewLeaveRequest.dart';
import 'package:schools/Student/homework.dart';

import '../constants/Theme.dart';
class Navbar extends StatefulWidget {
  const Navbar({Key? key , required this.isAdmin}) : super(key: key);
  final bool isAdmin;
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late bool isAdmin;
  void initState(){
    isAdmin = widget.isAdmin;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('muthukumar'),
            accountEmail: Text('muthukumar@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                // child: user_info.photoURL != null ? Image.network(
                //   user_info.photoURL.toString(),
                //   fit: BoxFit.cover,
                //   width: 90,
                //   height: 90,)
                child: Image.asset('assets/man.webp', fit: BoxFit.cover,
                  width: 90,
                  height: 90,),
              ),
            ),
            decoration: const BoxDecoration(
              color: ArgonColors.primary,
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/5442673.jpg'),
              // ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: ArgonColors.text),
            title: const Text('Home',style: TextStyle(color: ArgonColors.text  )),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute<dynamic>(
                builder: (BuildContext context) =>
                    Mainhome(isAdmin: isAdmin)
              ),
                      (route) => false
              );
            }

                
          ),

          const Divider(),
          isAdmin == true ? ListTile(
              leading: const Icon(Icons.home_work_outlined, color: ArgonColors.text),
              title: const Text('Manage HW',style: TextStyle(color: ArgonColors.text  )),
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (
                        BuildContext context) => homework())
                );
                setState(() {

                });

                // setState(() {
                //   isCallGoogle = false;
                // });
              }
          ) : ListTile(
              leading: const Icon(Icons.home_work_outlined, color: ArgonColors.text),
              title: const Text('My Homework',style: TextStyle(color: ArgonColors.text  )),
              onTap: () async{
                Navigator.push(context,
                    MaterialPageRoute(builder: (
                        BuildContext context) => homework())
                );
                setState(() {
                });
              }

            // Navigator.pushAndRemoveUntil(
            //     context, MaterialPageRoute<dynamic>(
            //   builder: (BuildContext context) =>
            //       MainClass(users: user_info),
            // ),
            //         (route) => false
            // ),
          ),
          isAdmin == true ? ListTile(
            leading: const Icon(Icons.class__outlined, color: ArgonColors.text),
            title: const Text('Create HW',style: TextStyle(color: ArgonColors.text  )),
            onTap: () =>{}
                // Navigator.pushAndRemoveUntil(
                //     context, MaterialPageRoute<dynamic>(
                //   builder: (BuildContext context) =>
                //       createClass(users: user_info),
                // ),
                //         (route) => false
                // ),
          ) : ListTile(
            leading: const Icon(Icons.class__outlined, color: ArgonColors.text),
            title: const Text('Join Class',style: TextStyle(color: ArgonColors.text  )),
            onTap: () =>{}
                // Navigator.push(
                //   context, MaterialPageRoute<dynamic>(
                //   builder: (BuildContext context) =>
                //       Joinclass(users: user_info),
                // ),
                // ),
    ),
          isAdmin == true ? ListTile(
            leading: const Icon(Icons.calendar_month_outlined , color: ArgonColors.text  ,),
            title: const Text('Attendace Report' ,style: TextStyle(color: ArgonColors.text  ),),
            onTap: () async{
              Navigator.push(context,
                  MaterialPageRoute(builder: (
                      BuildContext context) => AttendanceList(isAdmin: isAdmin,))
              );
              setState(() {
                // isCallGoogle = true;
              });
              // await AdminService.GetFriendClassList(context: context, users: user_info);
            },
          ) : ListTile(
            leading: const Icon(Icons.calendar_month_outlined, color: ArgonColors.text),
            title: const Text('Attendance' , style: TextStyle(color: ArgonColors.text),),
            onTap: ()async{
              Navigator.push(context,
                  MaterialPageRoute(builder: (
                      BuildContext context) => AttendanceDetail())
              );
              setState(() {
                // isCallGoogle = true;
              });
              // await UserService.GetFriendClassList(users: user_info, context: context);
            },
          ),

          isAdmin?ListTile(
            leading: const Icon(Icons.contact_mail_outlined , color: ArgonColors.text,),
            title: const Text('Leave Requests'),
            onTap: () async{
              Navigator.push(context,
                  MaterialPageRoute(builder: (
                      BuildContext context) => LeaveRequests(isAdmin: isAdmin)));
              setState(() {
                // isCallGoogle = true;
              });
              // await AdminService.GetClassExportList(users: user_info, context: context);
            },
          ):ListTile(
            leading: const Icon(Icons.contact_mail_outlined , color: ArgonColors.text,),
            title: const Text('Leave Request'),
            onTap: () async{
              Navigator.push(context,
                  MaterialPageRoute(builder: (
                      BuildContext context) => LeaveRequestForm()));
              // setState(() {
              //   // isCallGoogle = true;
              // });
              // await AdminService.GetClassExportList(users: user_info, context: context);
            },
          ),
          isAdmin?SizedBox():ListTile(
            leading: const Icon(Icons.mark_email_unread_outlined , color: ArgonColors.text,),
            title: const Text('Request Status'),
            onTap: () async{
              Navigator.push(context,
                  MaterialPageRoute(builder: (
                      BuildContext context) => LeaveStatus()));
              // setState(() {
              //   // isCallGoogle = true;
              // });
              // await AdminService.GetClassExportList(users: user_info, context: context);
            },
          ),
          // const Divider(),
          // isAdmin?const SizedBox():ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text('Settings'),
          //   onTap: () {
          //     Navigator.push(
          //       context, MaterialPageRoute<dynamic>(
          //       builder: (BuildContext context) =>
          //           Settings(users: user_info),
          //     ),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.diamond),
          //   title: const Text('Get Premium'),
          //   onTap: () =>
          //       Navigator.pushAndRemoveUntil(
          //           context, MaterialPageRoute<dynamic>(
          //         builder: (BuildContext context) =>
          //             premium(users: user_info),
          //       ),
          //               (route) => false
          //       ),
          // ),
          const Divider(),
          ListTile(
            title: const Text('Log Out',style: TextStyle(color: ArgonColors.text  )),
            leading: const Icon(Icons.exit_to_app , color: ArgonColors.text,),
            onTap: () async {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => Loginhome(),
                ),
                    (route) => false,//if you want to disable back feature set to false
              );
              // const SpinKitCircle(
              //   color: Colors.purple,
              //   size: 100.0,
              // );
              // await LoginWithCredentials.SignOut(context: context);
            },
          ),
        ],
      ),
    );
  }
}
