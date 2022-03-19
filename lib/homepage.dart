import 'package:betterplayer_sample/filepicker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Testing Purpose')),
      body: Center(child: ElevatedButton(onPressed: (){
        Permission.storage.request();
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> FilePickerDemo()));
      }, child: Text('Click here'))),
      
    );
  }
}