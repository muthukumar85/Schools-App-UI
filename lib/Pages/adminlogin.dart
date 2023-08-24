import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:schools/constants/Theme.dart';

import 'home.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({Key? key}) : super(key: key);

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isCallGoogle = false;
  String email = "";
  String password = "";
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  Future<void> _submit() async{
    // print('${myController2.value} ${myController1.value}');
    setState(() { isCallGoogle = true; });
    // await LoginWithCredentials.signInUsingEmailPassword(
    //  email: myController1.text, password: myController2.text, context: context);
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => Mainhome(isAdmin: true,),
      ),
          (route) => false,//if you want to disable back feature set to false
    );
    setState(() { isCallGoogle = true; });

  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(isCallGoogle){
      return const Scaffold(
          body:Center(
            child: SpinKitCircle(
              color: ArgonColors.primary,
              size: 100.0,
            ),
          ));
    }
    else {
      return Scaffold(
        backgroundColor: ArgonColors.secondary,
        appBar: AppBar(

          title: Text('Schools'),
          backgroundColor: ArgonColors.primary,

        ),
        body:
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(

                      child: SizedBox(
                        // width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  const Text('Admin Login',
                                    style: TextStyle(
                                        color: ArgonColors.primary,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0,
                                        fontFamily: 'OpenSans'
                                    ),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (
                                      //         BuildContext context) => const registerUser())
                                      // );
                                    },
                                    icon: const Icon(Icons.autorenew),
                                    iconSize: 30.0,
                                    color: ArgonColors.primary,
                                  )
                                ],
                              ),

                              const SizedBox(height: 20,),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      controller: myController1,
                                      decoration: const InputDecoration(
                                        // filled:true,
                                          suffixIcon: Icon(Icons.person,
                                            color: ArgonColors.primary,),
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
                                          labelText: 'Email',
                                          hoverColor: ArgonColors.primary
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      onFieldSubmitted: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !value.contains('@')) {
                                          return 'Invalid email!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 20,),
                                    TextFormField(
                                      controller: myController2,
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(Icons.wifi_password,
                                          color: ArgonColors.primary,),
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
                                        labelText: 'password',
                                        labelStyle: TextStyle(
                                          color: ArgonColors.primary,

                                        ),
                                      ),
                                      keyboardType: TextInputType
                                          .visiblePassword,
                                      obscureText: true,
                                      validator: (value) {
                                        if (value!.isEmpty &&
                                            value.length < 7) {
                                          return 'Invalid password!';
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 20,),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 0, right: 0, top: 8),
                                        child: RaisedButton(
                                          textColor: ArgonColors.white,
                                          color: ArgonColors.primary,
                                          onPressed: _submit,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                4.0),
                                          ),
                                          child: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.0,
                                                  right: 16.0,
                                                  top: 12,
                                                  bottom: 12),
                                              child: Text("SUBMIT",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      fontSize: 16.0))),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20,),


                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2.2,
                            offset: Offset(
                                2, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),

          ),
        ),
      );
    }
  }
}
