// import 'dart:core' as prefix0;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'dart:convert';  //json
//json解析

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
    List arr=[];

@override
void initState(){
  super.initState();
  fetchPost();
}
  
   
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: arr.length,
      itemBuilder:_listItemBuilder ,
      
    );
  }

  Widget _listItemBuilder(BuildContext context,int index){
    

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Stack(
        children: <Widget>[
          Column(
          children: <Widget>[
          Text(
            '${arr[index].title}',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 9,),
          Row(
            children: <Widget>[
              Expanded(           
                child: Container ( 
                    //  width: 100,
                // height: 100,         
                    child: Text(
                      '${arr[index].title}',
                      style: TextStyle(
                        color: Color(0xff7E829D),
                        fontSize: 11,
                        wordSpacing: sqrt1_2,
                        
                      ),
                    ),
                  ),
              ),

            
             
              


              SizedBox(width: 0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10,),
                                // SizedBox(hei: 20,),
                Text(
                '485qweq9浏览',
                
                style: TextStyle(
                  color: Color(0xff7E829D),
                  fontSize: 11,
                  
                  // height: 30
                ),
              ),
              SizedBox(height: 0,)

                ],

              ),
              
            ],
          )
        ],
        ),
        Container(
          width: screenWidth,
          height: 100,
          color: Color(0x00565645),
        )
        ],
      ),
      // height: 115,
      color: Color(0xff21212b),
    );
  }

    fetchPost() async {
    final response = await http.get('https://resources.ninghao.net/demo/posts.json');
   final response2 = await http.get('https://resources.ninghao.net/demo/posts.json');

  //  Demo demoModel = Demo.fromJson(json.decode(response2.body));
  //  for (Demo_data demo in demoModel.data) {
  //    print('comp_code =   ${demo.comp_code}');
  //    print('comp_name =   ${demo.comp_name}');

  //  }
  //  print(object)

    print('777777 statusCode :${response.statusCode}');
     print('88888888 body:${response.body}');
    var bodyStr= response.body;
    var bodyJson = json.decode(bodyStr);
    print('111');
    print('${bodyJson}'+ "110");
    List tempArr = [];
    for (var postItem in bodyJson['posts']) {
        final postModel = Post.fromJson(postItem);
        tempArr.add(postModel);    
    }
    setState(() {
      arr = tempArr;
    });
    final postModel = Post.fromJson(bodyJson['posts'][0]);
    print('title:${postModel.title}');

    print(bodyJson['posts'][0]['title']+ '   99999');

  }
}

class Post{
  final String title;
  final String description;
  Post(
    this.title,
    this.description
  );

  Post.fromJson(Map json)
    : title = json['title'],
    description = json['description'];

  
  Map toJson() => {
    'title':title,
    'description':description,
  };


}


class Demo{
  final int code;
  final String msg;
  var data;

  Demo(
    this.code,
    this.msg,
    this.data,
  );
   

   Demo.fromJson(Map json)
    : code = json['code'],
    msg = json['msg'],
    data = (json['data'] as List)?.map((e) => Demo_data.fromJson(e));

    Map toJson() => {
      'code':code,
      'msg':msg,
      'data':data,
    };    
}


class Demo_data{
  final String comp_code;
  final String comp_name;
  final String telephone;
  final int create_date;
  Demo_data(
    this.comp_code,
    this.comp_name,
    this.telephone,
    this.create_date,
  );

   Demo_data.fromJson(Map json)
    : comp_code = json['comp_code'],
    comp_name = json['comp_name'],
    telephone = json['telephone'],
    create_date = json['create_date'];

    Map toJson() => {
      'comp_code':comp_code,
      'comp_name':comp_name,
      'telephone':telephone,
      'create_date':create_date,
    };

}
