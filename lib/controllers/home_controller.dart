import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List screens = [
    Center(child: Text('1',style: TextStyle(color: Colors.white),),),
    Center(child: Text('2',style: TextStyle(color: Colors.white),),),
    Center(child: Text('3',style: TextStyle(color: Colors.white),),),
    Center(child: Text('4',style: TextStyle(color: Colors.white),),),
    Center(child: Text('5',style: TextStyle(color: Colors.white),),),

  ].obs;
  
}