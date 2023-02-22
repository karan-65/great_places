import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';
import '../model/place.dart';

class greatplaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addplace(String pickedtitle, File pickedimage) {
    final newplace = Place(
        id: DateTime.now().toString(),
        image: pickedimage,
        location: null,
        title: pickedtitle);
    _items.add(newplace);
    notifyListeners();
    dbhelper.insert('table',{'id':newplace.id,'title':newplace.title,'image':newplace.image.path});
  }

}
