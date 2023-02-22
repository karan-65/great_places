import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart'as syspath;
import 'package:path/path.dart'as path;

class imageinput extends StatefulWidget {
  final Function onselectimage;
  imageinput(this.onselectimage);

  @override
  _imageinputState createState() => _imageinputState();
}

class _imageinputState extends State<imageinput> {
  File? _storedimage;

  //function for taking image from camera
  Future<void>_takepicture()async{
    final picker=ImagePicker();
    final imagfile=await picker.pickImage(source: ImageSource.camera,maxWidth: 600);
    if(imagfile==null){
      return;
    }
//code setting the taken image to te view

    if (imagfile != null) {
      setState(() {
        _storedimage = File(imagfile.path);
      });
      final appdir=await syspath.getApplicationDocumentsDirectory();
      final filename=path.basename(imagfile.path);
      final savedimage=await _storedimage!.copy('${appdir.path}/$filename');
      widget.onselectimage(savedimage);
  }

  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedimage != null
              ? Image.file(
                  _storedimage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text("No Image taken",textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: ElevatedButton.icon(
          onPressed: _takepicture,
          icon: Icon(Icons.camera),
          label: Text("take picture"),
        )),
      ],
    );
  }
}
