import 'dart:convert';

import 'package:flutter/material.dart';

class VehicleListScreen extends StatefulWidget {
  @override
  _VehicleListScreenState createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  List vehicles = [];
  
  get http => null;

  @override
  void initState() {
    super.initState();
    fetchVehicles();
  }

  Future<void> fetchVehicles() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/vehicles'));

      if (response.statusCode == 200) {
        setState(() {
          vehicles = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load vehicles: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching vehicles: $error');
    }
  }

  Color getVehicleColor(int mileage, int year) {
    int currentYear = DateTime.now().year;
    int age = currentYear - year;
    if (mileage >= 15) {
      return (age <= 5) ? Colors.green : Colors.amber;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vehicle List')),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          var vehicle = vehicles[index];
          return Card(
            color: getVehicleColor(vehicle['mileage'], vehicle['year']),
            child: ListTile(
              title: Text(vehicle['name']),
              subtitle: Text('Mileage: ${vehicle['mileage']} km/l, Year: ${vehicle['year']}'),
            ),
          );
        },
      ),
    );
  }
}