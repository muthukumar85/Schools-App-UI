


import 'package:flutter/material.dart';
import 'package:schools/constants/Theme.dart';

import 'Popup.dart';
void showCommercialPopup(BuildContext context , Map<dynamic,dynamic> hw) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CommercialPopup(homework: hw,);
    },
  );
}
class makeHcards extends StatefulWidget {
  const makeHcards({Key? key , required this.data}) : super(key: key);
  final Map<dynamic,dynamic> data;
  @override
  State<makeHcards> createState() => _makeHcardsState();
}

class _makeHcardsState extends State<makeHcards> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
      {
        showCommercialPopup(context , widget.data['homework'])
      },
      child: Container(

        height: 100,

        margin: EdgeInsets.symmetric(horizontal: 16),

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
                // width: 100, // Adjust the width of the image container

                // child: ClipRRect(

                //   borderRadius: BorderRadius.circular(8),

                //   child: Image.asset('assets/man.webp', // Replace with your image URL

                //     fit: BoxFit.cover,

                //   ),

                // ),

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

                      widget.data['Subject'].toString(),

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

                      widget.data['title'].toString(),

                      style: TextStyle(fontSize: 14 , color: ArgonColors.text , overflow: TextOverflow.ellipsis ,),maxLines: 1,

                    ),

                  ],

                ),

              ),

              SizedBox(width: 16),

            ],

          ),

        ),

      ),
    );
  }}