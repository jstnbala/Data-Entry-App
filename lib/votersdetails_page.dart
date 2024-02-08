import 'package:data_entry_app/voting_page.dart';
import 'package:flutter/material.dart';
import 'package:data_entry_app/votersregistration_page.dart';

class VotersDetailsPage extends StatelessWidget {
  final String name;
  final String address;
  final String contactNumber;
  final String course;
  final int age;

  const VotersDetailsPage({
    Key? key,
    required this.name,
    required this.address,
    required this.contactNumber,
    required this.course,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String verificationMessage;
    if (age >= 18) {
      verificationMessage = "You can vote!";
    } else {
      verificationMessage = "You cannot vote.";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Voters Details Page",
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
                    SizedBox(height: 20),
                    Text(
                      verificationMessage,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF643843),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (age >= 18)
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => VotingPage(
                                  name: name,
                                  address: address,
                                  contactNumber: contactNumber,
                                  course: course,
                                  age: age,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF643843),
                          ),
                          child: const Text('GO TO VOTING PAGE', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    if (age < 18)
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VotersRegistrationPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF643843),
                          ),
                          child: const Text('BACK TO REGISTRATION PAGE', style: TextStyle(color: Colors.white)),
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF643843)),
          ),
          SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 16, color: Color(0xFF643843))),
        ],
      ),
    );
  }
}
