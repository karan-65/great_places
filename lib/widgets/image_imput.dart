import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imageinput extends StatefulWidget {
  const imageinput({Key? key}) : super(key: key);

  @override
  _imageinputState createState() => _imageinputState();
}

class _imageinputState extends State<imageinput> {
  File? _storedimage;

  //function for taking image from camera
  Future<void>_takepicture()async{
    final picker=ImagePicker();
    final imagfile=await picker.pickImage(source: ImageSource.camera,maxWidth: 600);
//code setting the taken image to te view
    if (imagfile != null) {
      setState(() {
        _storedimage = File(imagfile.path);
      });
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
