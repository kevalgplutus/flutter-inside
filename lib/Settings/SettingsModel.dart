import 'package:flutter/material.dart';
import 'package:inside/User/profile_view.dart';

class SettingsModel {
  List<Data>? data;

  SettingsModel({this.data});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? menuId;
  String? menuName;

  Data({this.menuId, this.menuName});

  Data.fromJson(Map<String, dynamic> json) {
    menuId = json['menuId'];
    menuName = json['menuName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuId'] = this.menuId;
    data['menuName'] = this.menuName;
    return data;
  }
}
