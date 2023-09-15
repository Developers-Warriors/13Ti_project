import 'package:flutter/material.dart';

class MyAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: vehicles.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(
              vehicles[index].title,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            // expandedAlignment: Alignment.bottomLeft,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('data'),
                    const SizedBox(height: 15),
                    Text('data'),
                    const SizedBox(height: 15),
                    Text('data'),
                  ],
                  // children: _buildExpandableContent(vehicles[i]),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }

  _buildExpandableContent(Vehicle vehicle) {
    List<Widget> columnContent = [];

    for (String content in vehicle.contents)
      columnContent.add(
        ListTile(
          title: Text(
            content,
            style: TextStyle(fontSize: 18.0),
          ),
          leading: Icon(vehicle.icon),
        ),
      );

    return columnContent;
  }
}

class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);
}

List<Vehicle> vehicles = [
  Vehicle(
    'Bike',
    ['Vehicle no. 1', 'Vehicle no. 2', 'Vehicle no. 7', 'Vehicle no. 10'],
    Icons.motorcycle,
  ),
  Vehicle(
    'Cars',
    ['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
    Icons.directions_car,
  ),
  Vehicle(
    'Merc',
    ['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
    Icons.directions_car,
  ),
  Vehicle(
    'KI',
    ['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
    Icons.directions_car,
  ),
  Vehicle(
    'Audi',
    ['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
    Icons.directions_car,
  ),
];
