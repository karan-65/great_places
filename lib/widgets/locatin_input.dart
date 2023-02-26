import 'package:flutter/material.dart';

class Locationinput extends StatefulWidget {
  const Locationinput({Key? key}) : super(key: key);

  @override
  _LocationinputState createState() => _LocationinputState();
}

class _LocationinputState extends State<Locationinput> {
   String _previewimgurl="";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border:Border.all(color: Colors.grey,width: 1)),
            alignment: Alignment.center,
            height: 170,
            width: double.infinity,
            child: _previewimgurl == null
                ? Text(
                    "No location chosen",
                    textAlign: TextAlign.center,
                  )
                : Image.network(
                    _previewimgurl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.location_on),
                label: Text("current location")),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text("Select on map")),
          ],
        )
      ],
    );
  }
}
