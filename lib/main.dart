//import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  Product carrot = Product("морковь");
  Product onion = Product("лук");
  Product potato = Product("картофель");
  Product meat = Product("мясо");
  Product water = Product("вода");
  RecipeOfSoup recipeOfSoup = RecipeOfSoup();
  List<Product> ingredients = [carrot, onion, potato, meat, water];
  Cook cook = Cook(ingredients, recipeOfSoup);
  cook.cutAll(ingredients);
  cook.grillProduct(cook.products.firstWhere((product) => product.name == "морковь"));
  cook.grillProduct(cook.products.firstWhere((product) => product.name == "лук"));
  cook.boilProduct(cook.products.firstWhere((product) => product.name == "вода"));

  cook.addProductInSoup(cook.products.firstWhere((product) => product.name == "вода"));
  cook.addProductInSoup(cook.products.firstWhere((product) => product.name == "мясо"));
  cook.boilProduct(cook.products.firstWhere((product) => product.name == "мясо"));
  cook.addProductInSoup(cook.products.firstWhere((product) => product.name == "картофель"));
  cook.boilProduct(cook.products.firstWhere((product) => product.name == "картофель"));
  cook.addProductInSoup(cook.products.firstWhere((product) => product.name == "лук"));
  cook.addProductInSoup(cook.products.firstWhere((product) => product.name == "морковь"));
  cook.soupReady();
}

class Cook{
  List<Product> products = [];
  List<Product> readySoup=[];
  RecipeOfSoup? recipe;
  Cook(List<Product> prods, RecipeOfSoup recipeOfSoup){
    products = prods;
    recipe = recipeOfSoup;
  }

  cutAll(List<Product> products){
    for(var product in products){
      product.startCut();
    }
  }
  grillProduct(Product product){
    product.startGrill();
  }
  boilProduct(Product product){
    product.startBoil();
  }
  addProductInSoup(Product productFirst){
    readySoup.add(productFirst);
  }
  soupReady(){
    int countReadyIngredients = 0;
    for (int i=0; i<products.length; i++){
      if (readySoup.contains(products[i]) & (products[i].boil ==true || products[i].grill == true)){
        countReadyIngredients++;
      }
    }
    if (countReadyIngredients == products.length){
      print("Суп готов!!!!!");
    }
    else{
      print("СУП НЕ ГОТОВ!!!!!");
    }
  }
}
class RecipeOfSoup{
  List<Product>? ingredients;
  List<String>? doSoup;
  RecipeOfSoup(){
    doSoup= ["нарезать все продукты",
      "пожарить лук", "пожарить морковь",
      "добавь воды",
      "сварить мясо", "сварить картоху",
      "добавить лук", "добавить морковь"];
  }
}
class Product{
  String? name;
  bool cut = false;
  bool grill = false;
  bool boil = false;
  Product(String n){
    name = n;
  }
  void startCut(){
    cut=true;
  }
  void startGrill(){
    grill = true;
  }
  void startBoil(){
    boil = true;
  }
}
