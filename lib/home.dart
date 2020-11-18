
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/extra/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sips/tabs/history.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
final drinkController = TextEditingController();
final DatePickerController _controller = DatePickerController();

DateTime _selectedDate = DateTime.now();

@override
void initState(){ 
  super.initState();
}

int _counter = 0;

void _incrementCounter(){ 
  setState(() {
    _counter ++;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
       body:ListView(
         padding: const EdgeInsets.all(20),
         children: [
          Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Text( 'Enter the name of the booze',
             style:GoogleFonts.pacifico(
        fontSize: 20.0,
           color:Colors.blue[900]),
             ),
             SizedBox(height:20),
             TextField(controller: drinkController,
             decoration: InputDecoration( 
               hintText: ('Konyagi'),
               hintStyle: TextStyle(
                 color: Colors.grey.withOpacity(0.5),
                 fontStyle: FontStyle.italic
               ),
               icon: FaIcon(FontAwesomeIcons.wineBottle,
               color:Colors.blue[900]
               ),
               fillColor: Colors.blue[900],
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide( 
                   color: Colors.blue[900],
                   width: 2
                 ),
                 borderRadius: BorderRadius.circular(25  )
               )
             ),
             ),
             SizedBox(height:40),
             Text('How many shots',
             style:GoogleFonts.pacifico(
        fontSize: 20.0,
           color:Colors.blue[900]),
             ),
             SizedBox(height:20),
             Text('$_counter',
             style:GoogleFonts.pacifico(
        fontSize: 30.0,
           color:Colors.blue[900]),
             ),
               SizedBox(height:40),
               Text('Pick a day',
             style:GoogleFonts.pacifico(
        fontSize: 20.0,
           color:Colors.blue[900]),
             ),
               Container(
                 child: Padding(
                   padding: const EdgeInsets.all(20),
                   child: DatePicker(
                     DateTime.now(),
                     height: 100,
                     width: 60,
                     controller: _controller,
                     dateTextStyle: defaultDayTextStyle,
                     initialSelectedDate: DateTime.now(),
                     selectedTextColor: Colors.white,
                     selectionColor: Colors.blue[900],
                     onDateChange: (date){
                       setState(() {
                         _selectedDate = date;
                       });
                     },
                   ),
                 ),
               ),
               SizedBox(height:40),

             RaisedButton( 
               onPressed: (){
                 var drink_entered = drinkController.text;
                 var shots = _counter;
                 var day = _selectedDate;

                 Navigator.push(context, 
                 MaterialPageRoute(
                   builder:(context) => History(guestDrink: drink_entered,
                   guestShots:shots,guestDay: day,)
                   )
                 );
               },
               shape: RoundedRectangleBorder( 
                 borderRadius: BorderRadius.circular(50),
               ),
               color: Colors.blue[900],
               child: Text('Save',
               style: TextStyle(color: Colors.white),),
             )
      ],
      ),
         ),
         ]
       ),
       floatingActionButton: FloatingActionButton( 
         onPressed: _incrementCounter,
         child: Icon(Icons.add,
         ),
         backgroundColor: Colors.blue[900],
       ),
    );
  }
}

 //Counter(
               //initialValue: _defaultValue,
                //minValue: 0, 
                //maxValue: 10, 
                //decimalPlaces: 0 ,
                //onChanged: (value){
                  //setState(() {
                    //_defaultValue = value;
                    //counter = value;
                  //});
               // }
               // ),