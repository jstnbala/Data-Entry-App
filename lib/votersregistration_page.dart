import 'package:flutter/material.dart';
import 'votersdetails_page.dart';

class VotersRegistrationPage extends StatefulWidget {
  const VotersRegistrationPage({Key? key}) : super(key: key);

  @override
  State<VotersRegistrationPage> createState() => _VotersRegistrationPageState();
}

class _VotersRegistrationPageState extends State<VotersRegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController ageController = TextEditingController(); 

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Voters Registration Page",
          style: TextStyle(color: Color(0xFFFDF0D1)),
        ),
        backgroundColor: Color(0xFF643843),
      ),
      body: Container(
        color: Color(0xFF607274),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
          child: Form(
            key: _formKey, 
            child: Container(
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
                    _buildTextField(nameController, "Enter your Name", Icons.person),
                    SizedBox(height: 15),
                    _buildTextField(addressController, "Enter your Address", Icons.location_on),
                    SizedBox(height: 15),
                    _buildTextField(contactNumberController, "Enter your Contact Number", Icons.phone),
                    SizedBox(height: 15),
                    _buildTextField(courseController, "Enter your Course", Icons.school),
                    SizedBox(height: 15),
                    _buildAgeTextField(), 
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String name = nameController.text;
                          String address = addressController.text;
                          String contactNumber = contactNumberController.text;
                          String course = courseController.text;
                          int age = int.tryParse(ageController.text) ?? 0; 

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VotersDetailsPage(
                                name: name,
                                address: address,
                                contactNumber: contactNumber,
                                course: course,
                                age: age,
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF643843),
                        onPrimary: Color(0xFFFDF0D1),
                      ),
                      child: const Text('SUBMIT DATA'),
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

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon) {
    return TextFormField(
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  Widget _buildAgeTextField() {
    return TextFormField(
      controller: ageController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF643843)),
        ),
        labelText: "Enter your Age",
        prefixIcon: Icon(Icons.calendar_today, color: Color(0xFF643843)),
        labelStyle: TextStyle(color: Color(0xFF643843)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF643843)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF643843)),
        ),
        errorStyle: TextStyle(color: Colors.red), 
      ),
      style: TextStyle(color: Color(0xFF643843)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
          return 'Please enter numbers only';
        }
        return null;
      },
      keyboardType: TextInputType.number,
    );
  }
}
