import 'package:flutter/material.dart';

class DrawDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.fromLTRB(0, 64, 0, 500),
        padding: EdgeInsets.zero,
        children: <Widget>[
          Text('data'),
          ListTile(
            title: Text('title'),
            subtitle: Text('subtitle'),
            onTap: () => {
              print('object')
            },
          )
        ],
      ),
    );
  }
}
// DrawDemo
