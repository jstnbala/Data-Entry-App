import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String presidentName;
  final String vicePresidentName;
  final String name;
  final String address;
  final String contactNumber;
  final String course;
  final int age;

  const ResultsPage({
    Key? key,
    required this.presidentName,
    required this.vicePresidentName,
    required this.name,
    required this.address,
    required this.contactNumber,
    required this.course,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Results Page",
          style: TextStyle(color: Color(0xFFFDF0D1)),
        ),
        backgroundColor: Color(0xFF643843),
      ),
      backgroundColor: Color(0xFF607274),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFF643843), width: 3),
                color: Color(0xFFFDF0D1),
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
                    _buildDetail('Age:', age.toString()),
                    _buildDetail('President Name:', presidentName),
                    _buildDetail('Vice President Name:', vicePresidentName),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF643843),
                          ),
                          child: const Text('BACK', style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.popUntil(context, ModalRoute.withName('/'));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF643843),
                          ),
                          child: const Text('CLOSE', style: TextStyle(color: Colors.white)),
                        ),
                      ],
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF643843)),
          ),
          SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 16, color: Color(0xFF643843))),
        ],
      ),
    );
  }
}
