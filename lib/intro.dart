import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sips/home.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

   final int _numPages = 2;
      final PageController _pageController = PageController(initialPage: 0);
      int _currentPage = 0;

      List<Widget>_buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

     Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blueAccent : Colors.white ,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomPadding: false,
     backgroundColor: Colors.blueAccent[400],
     body:AnnotatedRegion<SystemUiOverlayStyle>(
       value:SystemUiOverlayStyle.light,
       child:Container(
         
         child: Padding(padding: EdgeInsets.symmetric(vertical: 40.0),
         child:Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             Container(
               alignment:Alignment.centerRight,
               child:FlatButton(
                onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)
                    => Home()
                 ),
                   );
                 },
                 child: Text('Skip',
                 style:GoogleFonts.montserrat(
                   fontSize:20.0,
                   color:Colors.white
                 )
                 ),
               ),
             ),
             Container(
               height:600.0,
               child:PageView(
                 physics:ClampingScrollPhysics(),
                 controller:_pageController,
                 onPageChanged:(int page) {
                   setState((){
                     _currentPage = page;
                   });
                 },
                 children:<Widget>[
                   Padding(
                     padding: EdgeInsets.all(40.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Container(
                           child:Stack(
                             children:<Widget>[
                               Container(
                                  padding:EdgeInsets.fromLTRB(80.0, 250.0, 0.0, 0.0),
                                 child: Text('Sips',
                                 style: GoogleFonts.pacifico(
                                   fontSize: 75.0,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white
                                 ),
                                 textAlign: TextAlign.center,
                                 ),
                               ),
                                 Container(
                                  padding:EdgeInsets.fromLTRB(240.0, 273.0, 0.0, 0.0),
                                 child: Text('.',
                                 style: GoogleFonts.montserrat(
                                   color: Colors.white,
                                   fontSize: 80.0,
                                   fontWeight: FontWeight.bold,
                                 ),
                                 ),
                               )
                             ]
                           )
                         )
                       ],
                     ),
                     ),
                  
                   Padding(
                     padding: EdgeInsets.all(40.0),
                     child: Column(
                       crossAxisAlignment:CrossAxisAlignment.start,
                       children:<Widget>[
                         Center(
                           child:Image(
                             image:AssetImage(
                               'assets/peeps.png'
                             ),
                             height:300.0,
                             width:300.0
                           ),
                         ),
                         SizedBox(height:30.0),
                         Text(
                           'Keep track of drinks when you are out with freinds.',
                           style:GoogleFonts.montserrat(
                               color: Colors.white,
                         fontWeight: FontWeight.w400,
                         fontSize: 33.0
                           ),
                            textAlign: TextAlign.center,
                         )
                       ]
                     ),
                     ),
                     Padding(
                     padding: EdgeInsets.all(40.0),
                     child: Column(
                       crossAxisAlignment:CrossAxisAlignment.start,
                       children:<Widget>[
                         Center(
                           child:Image(
                             image:AssetImage(
                               'assets/solo.png' 
                             ),
                             height:300.0,
                             width:300.0
                           ),
                         ),
                         SizedBox(height:30.0),
                         Text(
                           'Or unwinding after a long week.',
                           style:GoogleFonts.montserrat(
                               color: Colors.white,
                         fontWeight: FontWeight.w400,
                         fontSize: 33.0
                           ),
                            textAlign: TextAlign.center,
                         )
                       ]
                     ),
                     ),
                 ],
               )
             ),
             Row( 
               mainAxisAlignment: MainAxisAlignment.center,
               children:_buildPageIndicator(),
             ),
             _currentPage != _numPages - 0
                
             ?Expanded(
               child: Align(
                 alignment:FractionalOffset.bottomRight,
                 child:FlatButton(
                   onPressed:() {
                     _pageController.nextPage(duration:  Duration(milliseconds: 500),
                     curve: Curves.ease,);
                   },
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children:<Widget>[
                                Text('Next',
                                style: GoogleFonts.montserrat(
                                  color:Colors.white,
                                  fontSize:22.0,
                                ),
                                textAlign: TextAlign.center,
                                ),
                                SizedBox(width:10.0),
                                Icon(
                                  Icons.arrow_forward_ios ,
                                  color:Colors.white,
                                  size:30.0
                                )
                              ]
                   ),
                 )
               ),
             )
             :Text('')
         ]
         )
         ),
       )
     ),
     bottomSheet: _currentPage == _numPages - 0
     ? Container(
       height: 100.0,
       width: double.infinity,
       color: Colors.blueAccent[400],
       child: GestureDetector(
          onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)
                    => Home(),
                 ),
                   );
                 },
                 child: Padding(
                   padding: EdgeInsets.only(bottom: 30.0),
                   child: Text('Get Started',
                   style:GoogleFonts.montserrat(
                     color:Colors.white,
                     fontSize:20.0,
                     fontWeight:FontWeight.bold
                   ),
                    textAlign: TextAlign.center,
                   ),
                   ),
       ),
     )
     : Text(''),
   );
  }
}