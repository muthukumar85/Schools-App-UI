import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schools/components/Appbar.dart';
import 'package:schools/components/Navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:schools/constants/Theme.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({Key? key , required this.isAdmin}) : super(key: key);
  final bool isAdmin;
  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  List<String> imageList = [
    'Event 1','Event 2','Event 3','Event 4'
    // Add more image paths here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars('Schools'),
      drawer: Navbar(isAdmin: widget.isAdmin,),
      body: Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0,left: 15 , bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Main Events",
                        style: TextStyle(fontSize: 38, color: ArgonColors.text , fontWeight: FontWeight.w300)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 220,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 205.0,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              // Do something when the page changes
                            },
                          ),
                          items: imageList.map((item) => Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: ArgonColors.primary,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8) , topRight: Radius.circular(8)  )
                                  ),

                                   width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0 , bottom: 4),
                                    child: Text(item , style: TextStyle(color: ArgonColors.white , fontSize: 30),textAlign: TextAlign.center,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20 , right: 20 , top: 5),
                                  child: Text('An event description is a piece of text or copy. These details come together to create a compelling statement which will help to draw in your target audience and even gain new guests!'
                                  , style: TextStyle(color: ArgonColors.text , fontSize: 18),overflow: TextOverflow.fade,maxLines: 3,),
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20 , top: 5),
                                    child: Text('Date: 08/09/2023' , style: TextStyle(color: ArgonColors.success , fontSize: 18 , fontWeight: FontWeight.w500 ),textAlign: TextAlign.start,),
                                    ),
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
                          )).toList(),
                        ),
                      ),
                    )

                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
