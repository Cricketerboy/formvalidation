import 'dart:convert'; // Import for JSON conversion
import 'package:flutter/material.dart';
import 'package:formproject/personalScreen.dart';

class SelectPlanScreen extends StatefulWidget {
  @override
  _SelectPlanScreenState createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  final _formKey = GlobalKey<FormState>();

  int _selectedPlan = 1;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> formData = {
        "selected_plan": {
          "plan_name": _selectedPlan == 0
              ? "Basic"
              : _selectedPlan == 1
                  ? "Standard"
                  : "Enterprise",
          "price": _selectedPlan == 0
              ? 0
              : _selectedPlan == 1
                  ? 99
                  : 499
        },
        "card_number": _cardNumberController.text,
        "name_on_card": _nameOnCardController.text,
        "expiry": _expiryController.text,
        "cvc": _cvcController.text,
      };

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Collected Data"),
            content: SingleChildScrollView(
              child: Text(
                JsonEncoder.withIndent("  ").convert(formData),
                style: TextStyle(fontSize: 14),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        },
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
                    'Select Plan',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Select plan as per your requirement',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: PlanCard(title: "Basic", price: 0, index: 0)),
                      SizedBox(width: 10),
                      Expanded(
                          child:
                              PlanCard(title: "Standard", price: 99, index: 1)),
                      SizedBox(width: 10),
                      Expanded(
                          child: PlanCard(
                              title: "Enterprise", price: 499, index: 2)),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Payment Information',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Enter your card information',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  CustomLabeledTextField(
                      label: "Card Number",
                      hint: '0000 0000 0000 0000',
                      controller: _cardNumberController,
                      validator: (value) {
                        if (value!.isEmpty || value.length != 16) {
                          return "Enter a valid 16-digit card number";
                        }
                        return null;
                      }),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomLabeledTextField(
                          label: "Name on Card",
                          hint: 'John Doe',
                          controller: _nameOnCardController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Invalid";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: CustomLabeledTextField(
                          label: "Expiry",
                          hint: 'MM / YY',
                          controller: _expiryController,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^\d{2}\/\d{2}$').hasMatch(value)) {
                              return "Invalid";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: CustomLabeledTextField(
                          label: "CVC",
                          hint: '234',
                          controller: _cvcController,
                          validator: (value) {
                            if (value!.isEmpty || value.length != 3) {
                              return "Invalid";
                            }
                            return null;
                          },
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
                            onPressed: () {
                              setState(() {
                                _selectedPlan =
                                    1; // Reset plan selection to default (Standard)
                                _cardNumberController.clear();
                                _nameOnCardController.clear();
                                _expiryController.clear();
                                _cvcController.clear();
                              });
                            },
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
                                Text('Discard', style: TextStyle(fontSize: 14)),
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
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child:
                                Text('Submit', style: TextStyle(fontSize: 14)),
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

  Widget PlanCard(
      {required String title, required int price, required int index}) {
    String description;
    switch (index) {
      case 0:
        description = "A simple start for students";
        break;
      case 1:
        description = "Ideal for individuals & small teams";
        break;
      case 2:
        description = "Advanced features for large businesses";
        break;
      default:
        description = "";
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedPlan == index ? Colors.green : Colors.grey,
            width: _selectedPlan == index ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(15),
        child: SizedBox(
          height: 220, // Set a fixed height for all cards
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(
                description,
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              FittedBox(
                child: Text.rich(
                  TextSpan(
                    text: "\$",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                    children: [
                      TextSpan(
                        text: "$price",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      TextSpan(
                        text: " /month",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Radio(
                value: index,
                groupValue: _selectedPlan,
                onChanged: (value) {
                  setState(() {
                    _selectedPlan = value as int;
                  });
                },
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
