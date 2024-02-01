import 'package:flutter/material.dart';
import 'details_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "College Information Registration",
          style: TextStyle(color: Color(0xFFFDF0D1)), // Text color of the app bar title
        ),
        backgroundColor: Color(0xFF643843),
      ),
      body: Container(
        color: Color(0xFF607274), // Background color of the box
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 120.0, 50.0, 120.0), // Adjusted padding
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFFDF0D1), // Background color of the RegistrationPage
              border: Border.all(color: Color(0xFF643843), width: 2), // Border color of the box
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
                  _buildTextField(nameController, "Enter your Name", Icons.person),
                  SizedBox(height: 15),
                  _buildTextField(addressController, "Enter your Address", Icons.location_on),
                  SizedBox(height: 15),
                  _buildTextField(contactNumberController, "Enter your Contact Number", Icons.phone),
                  SizedBox(height: 15),
                  _buildTextField(courseController, "Enter your Course", Icons.school),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Get the entered data before navigating
                      String name = nameController.text;
                      String address = addressController.text;
                      String contactNumber = contactNumberController.text;
                      String course = courseController.text;

                      // Clear TextFields before navigating
                      nameController.clear();
                      addressController.clear();
                      contactNumberController.clear();
                      courseController.clear();

                      // Navigate to DetailsPage with the entered data
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            name: name,
                            address: address,
                            contactNumber: contactNumber,
                            course: course,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF643843), // background color
                      onPrimary: Color(0xFFFDF0D1), // text color
                    ),
                    child: const Text('SUBMIT DATA'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF643843)), // Outline color of the input field
        ),
        labelText: labelText,
        prefixIcon: Icon(icon, color: Color(0xFF643843)), // Icon color
        labelStyle: TextStyle(color: Color(0xFF643843)), // Font color of the text
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF643843)), // Outline color when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF643843)), // Outline color when not focused
        ),
      ),
      style: TextStyle(color: Color(0xFF643843)), // Font color of the text
      autofocus: true,
    );
  }
}
