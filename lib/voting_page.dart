import 'package:data_entry_app/results_page.dart';
import 'package:flutter/material.dart';
import 'package:data_entry_app/votersregistration_page.dart'; 

class VotingPage extends StatelessWidget {
  final String name;
  final String address;
  final String contactNumber;
  final String course;
  final int age;

  const VotingPage({
    Key? key,
    required this.name,
    required this.address,
    required this.contactNumber,
    required this.course,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController presidentNameController = TextEditingController();
    TextEditingController vicePresidentNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Voting Page",
          style: TextStyle(color: Color(0xFFFDF0D1)),
        ),
        backgroundColor: Color(0xFF643843),
      ),
      backgroundColor: Color(0xFF607274),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFFDF0D1),
                border: Border.all(color: Color(0xFF643843), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 15,
                    blurRadius: 15,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildTextField(
                        presidentNameController, "Enter President Name", Icons.person),
                    SizedBox(height: 15),
                    _buildTextField(
                        vicePresidentNameController, "Enter Vice President Name", Icons.person),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            String presidentName = presidentNameController.text;
                            String vicePresidentName = vicePresidentNameController.text;

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ResultsPage(
                                  presidentName: presidentName,
                                  vicePresidentName: vicePresidentName,
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
                          child: const Text('SUBMIT', style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
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
                        child: const Text('CANCEL', style: TextStyle(color: Colors.white)),
                      ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF643843)),
        ),
        labelText: labelText,
        prefixIcon: Icon(icon, color: Color(0xFF643843)),
        labelStyle: TextStyle(color: Color(0xFF643843)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF643843)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF643843)),
        ),
      ),
      style: TextStyle(color: Color(0xFF643843)),
      autofocus: true,
    );
  }
}
