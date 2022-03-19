import 'dart:io';

import 'package:betterplayer_sample/palyer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PIckFile extends StatelessWidget {
  const PIckFile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('data'),),
      body: Center(
        child: ElevatedButton(

          // picking multiple files
          // onPressed: () async{
          //     final result = await FilePicker.platform.pickFiles(
          //       allowMultiple: true,
          //       type: FileType.video,
          //       // allowedExtensions: ['pdf', 'mp4'],
          //       );
          //     if (result == null) return;
          // //     final file = result.files.first;
          // // openFiles(result.files);
          

          // },


          // picking one file
          onPressed: () async{
              final result = await FilePicker.platform.pickFiles( type: FileType.video);
              if (result == null) return;
              final file = result.files.first;
              openFile(file);
              print('Name: ${file.name}');
              print('Bytes: ${file.bytes}');
              print('Size: ${file.size}');
              print('Extension: ${file.extension}');
              print('Path: ${file.path}');

            final newFile = await saveFilePermenently(file);

            print('FromPath: ${file.path}');
            print('ToPath: ${newFile.path}');
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayerScreen(path: newFile.path,)));
          }, 
          child: Text('Pick File')),
          
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

 Future<File> saveFilePermenently(PlatformFile file) async {
   final appStorage = await getApplicationDocumentsDirectory();
   final newFile = File('${appStorage.path}/${file.name}');
  
   return File(file.path!).copy(newFile.path);
  }

  // void openFiles(List<PlatformFile> files) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilesPage()));
  // }
}