import 'package:flutter/material.dart';

class DeviceModel {
  TextEditingController? addQuanyityController = TextEditingController();
  TextEditingController? addColor1Controller = TextEditingController();
  TextEditingController? addColor2Controller = TextEditingController();
  TextEditingController? deleteQuantityController = TextEditingController();
  TextEditingController? deletecolor1Controller = TextEditingController();
  TextEditingController? deletecolor2Controller = TextEditingController();
  //! _________ vaeiables for parsing ________
  int? addQuantityParsing;
  int? addColor1Parsing;
  int? addColor2Parsing;
  int? deleteQuantityParsing;
  int? deleteColor1Parsing;
  int? deleteColor2Parsing;
  //!_________ varibles clculating proccess ______
  int? addQuantityCalculate;
  int? addColor1Calculate;
  int? addColor2Calculate;
  int? deleteQuantityCalculate;
  int? deleteColor1Calculate;
  int? deleteColor2Calculate;
  //!  _________  key name for Hive to put data ______
  String? addQuantityHiveKey;
  String? addColor1HiveKey;
  String? addColor2HiveKey;
  String? deleteQuantityHiveKey;
  String? deleteColor1HiveKey;
  String? deleteColor2HiveKey;
  DeviceModel(
      {this.addQuanyityController,
      this.addColor1Controller,
      this.addColor2Controller,
      this.deleteQuantityController,
      this.deletecolor1Controller,
      this.deletecolor2Controller,
      this.addQuantityParsing,
      this.addColor1Parsing,
      this.addColor2Parsing,
      this.deleteQuantityParsing,
      this.deleteColor1Parsing,
      this.deleteColor2Parsing,
      this.addQuantityCalculate,
      this.addColor1Calculate,
      this.addColor2Calculate,
      this.deleteQuantityCalculate,
      this.deleteColor1Calculate,
      this.deleteColor2Calculate,
      this.addQuantityHiveKey,
      this.addColor1HiveKey,
      this.addColor2HiveKey,
      this.deleteQuantityHiveKey,
      this.deleteColor1HiveKey,
      this.deleteColor2HiveKey});
}
