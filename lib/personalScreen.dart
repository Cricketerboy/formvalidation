import 'package:flutter/material.dart';
import 'package:formproject/selectPlanScreen.dart';

class PersonalScreen extends StatefulWidget {
  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _validateAndProceed() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectPlanScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Enter Your Personal Information',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: CustomLabeledTextField(
                              controller: _firstController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                }
                              },
                              label: 'First Name',
                              hint: 'john')),
                      SizedBox(width: 10),
                      Expanded(
                          child: CustomLabeledTextField(
                              controller: _lastController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                }
                              },
                              label: 'Last Name',
                              hint: 'Doe')),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: CustomLabeledTextField(
                              controller: _phoneController,
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Phone number is required';
                                if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                  return 'Enter a valid 10-digit phone number';
                                }
                                return null;
                              },
                              label: 'Mobile',
                              hint: '202 555 0111')),
                      SizedBox(width: 10),
                      Expanded(
                          child: CustomLabeledTextField(
                              controller: TextEditingController(),
                              label: 'Pincode',
                              hint: '689421')),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomLabeledTextField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) return 'Email cannot be empty';
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      label: 'Email',
                      hint: 'mohitanand423@gmail.com'),
                  SizedBox(height: 10),
                  CustomLabeledTextField(
                      controller: TextEditingController(),
                      label: 'Address',
                      hint: '777, Mendez Plains, Florida'),
                  SizedBox(height: 10),
                  CustomLabeledTextField(
                      controller: TextEditingController(),
                      label: 'Landmark',
                      hint: 'Mendez Plains'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: CustomLabeledTextField(
                              controller: TextEditingController(),
                              label: 'City',
                              hint: 'Miami')),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'State',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.4),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                              ),
                              isDense: true,
                              hint: Text('New York'),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              items: ['New York', 'California', 'Florida']
                                  .map((state) => DropdownMenuItem(
                                        child: Text(state),
                                        value: state,
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade400,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.arrow_back,
                                    color: Colors.white, size: 18),
                                SizedBox(width: 5),
                                Text('Previous',
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 60),
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectPlanScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Next', style: TextStyle(fontSize: 14)),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward,
                                    color: Colors.white, size: 18),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  CustomLabeledTextField({
    required this.label,
    required this.hint,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label, // Bold label above the text field
          style: TextStyle(
              fontSize: 15,
              color: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), // Set grey border
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey), // Grey border for normal state
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey, width: 2), // Grey border on focus
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ],
    );
  }
}
