import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class LoginApex extends StatefulWidget {
  @override
  _LoginApexState createState() => _LoginApexState();
}

class _LoginApexState extends State<LoginApex> {

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Color(0xff21212b),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //返回按钮
            Container(
              width: MediaQuery.of(context).size.width,
              height: 88,
              color: Color(0xff21212b),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 24,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Color(0xffffffff),
                      onPressed: () =>{
                        Navigator.pop(context),
                      },
                    ),
                    
                  )
                   
                ],
              ),
            ),

            SizedBox(height:106 ,),
            Center(
              child: Image.asset('images/logo.png',width: 64,height: 64,),
            ),

            Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),           
              child:Column(
                children: <Widget>[
                   Text('We’ve received \n information',
                          overflow:TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 24,
                            ),
                        ),
                      SizedBox(height: 15,),
                   Text(
                     "we’ll contact you soon to open account for you.",
                      style: TextStyle(
                       fontSize: 14,
                       color: Color(0xff7E829D),
                     ),
                     
                   ),

             SizedBox(height: 60,),      
           Row(            
             children: <Widget>[
               SizedBox(width: 15,),
               Expanded(
                 child: ClipRRect(
                   //圆角
                  borderRadius:BorderRadius.circular(5),

                  // BorderRadius.all(Radius.elliptical(8, 8)), //椭圆
//  topLeft: radius,
//     topRight: radius,
//     bottomLeft: radius,
//     bottomRight: radius,

                   child: Container(
                    //  width: 5,
                  //  height: 10,

                 width: screenWidth-30,
                 height: 40,
                 child: RaisedButton(
                   
                    color: Color(0xff387CFE),            
                    child: Text('Complete',style: TextStyle(color: Color(0xffffffff)),),
                    onPressed: ()=>{
                      Navigator.pop(context),
                      print('object')
                    },
                  ),
               ),
                 )
               ),
              SizedBox(width: 15,),
             ],
           ),



                ],
              )
            
            ),
          ],
        ),
      ),
    );
  }
}