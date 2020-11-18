import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatelessWidget {


final guestDrink;
final guestShots;
final guestDay;
History({this.guestDrink,this.guestShots,this.guestDay});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.blue[900],
        title:Text('Sips',
        style:GoogleFonts.pacifico(
        fontSize: 30.0,
           color:Colors.white),
),
centerTitle:true,
elevation:0.0,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        children: [
          Container(
            height: 220,
            child: Card( 
             
              child:Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(children: [
                  Padding( 
                    padding: EdgeInsets.only(top: 5),
                    child: FaIcon(FontAwesomeIcons.glassWhiskey,
               color:Colors.white
               ),
                  ),
                  SizedBox(height:20),
                  Container( 
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    child: Text('$guestDrink',
               style: TextStyle( 
                 color: Colors.white,
                 fontSize: 20,
                 fontWeight: FontWeight.w400
             ),
             textAlign: TextAlign.center,) ,
                  ),
                  SizedBox(width:10),
                  Container( 
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    child: Text('Shots: $guestShots',
               style: TextStyle( 
                 color: Colors.white,
                 fontSize: 20,
                 fontWeight: FontWeight.w400
             ),
             textAlign: TextAlign.center,) ,
                  ),
                   Container( 
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 40),
                    child: Text('$guestDay' == null ? 'No Date Choosen!' :'$guestDay',
               style: TextStyle( 
                 color: Colors.white,
                 fontSize: 20,
                 fontWeight: FontWeight.w400
             ),
             textAlign: TextAlign.center,) ,
                  )
                ],),
              ),
              color: Colors.blue[900],
               elevation: 20,
            ),
          )
      ],)
          );
  }
}

