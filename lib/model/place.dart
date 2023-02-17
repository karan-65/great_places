import 'dart:html';

import 'package:flutter/material.dart';

class location{
   final String longitude;
   final String latitude;
   final String address;
   location({required this.address,required this.latitude,required this.longitude});
}
class Place{
   final String id;
   final String title;
   final location;
   final File image;

   Place({required this.id,required this.image,required this.location,required this.title});

}