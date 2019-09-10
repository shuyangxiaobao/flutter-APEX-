import 'package:flutter/material.dart';

class DrawDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.fromLTRB(0, 64, 0, 500),
        padding: EdgeInsets.zero,
        children: <Widget>[
          //用户头像
            UserAccountsDrawerHeader(
              accountName: Text('geqiangbao Head', style: TextStyle(fontWeight: FontWeight.w900),),
              accountEmail: Text('xiaolaopo@qq.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562761580457&di=10bd1cee93032866c2fe9ff6e578c3bc&imgtype=0&src=http%3A%2F%2Fimage.haha.mx%2F2018%2F09%2F18%2Fmiddle%2F2783764_dadc89ccdcc5366a829f3b1da426c8aa_1537242721.jpg'),
                // radius: 40,
                maxRadius: 100,
                minRadius: 30,
                child: Text('小明',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),     
              ),
              //背景
              decoration: BoxDecoration(
                color: Color(0xffff0000),
                image:DecorationImage(
                  image: NetworkImage(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566205394090&di=d5dbf8d1f10c03bf031c8cbf61bf968a&imgtype=0&src=http%3A%2F%2Fpic1.nipic.com%2F2008-12-05%2F200812584425541_2.jpg'
                  ),
                  fit: BoxFit.cover, //图像填充
                  colorFilter: ColorFilter.mode(
                  Color(0x56ff0000),
                  BlendMode.srcOver, //混合模式

                  )
                )
              ),
            ),



          ListTile(
            title: Text('message'),
            trailing: Icon(Icons.message, color:Color(0xff7878f6),size:30),
            subtitle: Text('subtitle',textAlign: TextAlign.right,),
            onTap: () => {
              Navigator.pop(context)
            },            
          ),

           ListTile(
            title: Text('mic_none'),
            trailing: Icon(Icons.mic_none, color:Color(0xff7878f6),size:30),
            subtitle: Text('subtitle',textAlign: TextAlign.center,),
            onTap: () => {
              Navigator.pop(context)
            },            
          ),

         
        ],
      ),
    );
  }
}
// DrawDemo
