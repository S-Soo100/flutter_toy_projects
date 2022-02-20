import 'package:flutter/material.dart';

class ShoppingCart with ChangeNotifier{
  List<String> _products = ['coffee', 'salt', 'milk', 'avocado', 'apple'];

  int get count => _products.length;
  List<String> get products => _products;

  void addItem(String item){
    _products.add(item);
    notifyListeners();
  }

  void purchase(){
    _products = [];
    notifyListeners();
  }

  void delItem(String item){
    _products.remove(item);
    notifyListeners();
  }
}