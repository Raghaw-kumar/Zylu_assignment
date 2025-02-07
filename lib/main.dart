import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zylu_assignment/vehicle_list_screen.dart';

void main() {
  runApp(VehicleApp());
}

class VehicleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VehicleListScreen(),
    );
  }
}