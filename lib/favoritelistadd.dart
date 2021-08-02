import 'package:flutter/material.dart';

import 'globaldata.dart';

class FavoriteListAdd extends ChangeNotifier{
List<GlobalData> favoritelist=[];

addDataInFavoriteList(GlobalData obj){
  favoritelist.add(obj);
  notifyListeners();
}
removeDataInFavoriteList(GlobalData obj){
  favoritelist.remove(obj);
  notifyListeners();
}

}