import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  final String address;
  final String contactNumber;
  final String course;

  const DetailsPage({
    Key? key,
    required this.name,
    required this.address,
    required this.contactNumber,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details Page",
          style: TextStyle(color: Color(0xFFFDF0D1)), // Text color of the app bar title
        ),
        backgroundColor: Color(0xFF643843), // Background color of the app bar
      ),
      backgroundColor: Color(0xFF607274),// Background color of the entire page
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFF643843), width: 2), // Border color of the box
                color: Color(0xFFFDF0D1), // Background color of the box
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildDetail('Name:', name),
                    _buildDetail('Address:', address),
                    _buildDetail('Contact Number:', contactNumber),
                    _buildDetail('Course:', course),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF643843), // Background color of the button
                        ),
                        child: const Text('CLOSE', style: TextStyle(color: Colors.white)), // Text color of the button
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF643843)), // Font color of the label
          ),
          SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 16, color: Color(0xFF643843))), // Font color of the value
        ],
      ),
    );
  }
}
