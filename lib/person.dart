//Muhammad Noman Riaz
//21-Arid-4010

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

import 'services/database.dart';

class PersonForm extends StatefulWidget {
  const PersonForm({super.key});

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController uNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Add Person Record',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: fNameController,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        hintText: 'Enter your first name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.orange,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                      ),
                      style: const TextStyle(fontFamily: "Robo"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: lNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Enter your last name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.orange,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                      ),
                      style: const TextStyle(fontFamily: "Robo"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: uNameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.orange,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                      ),
                      style: const TextStyle(fontFamily: "Robo"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.orange,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                      ),
                      style: const TextStyle(fontFamily: "Robo"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number',
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.orange,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                      ),
                      style: const TextStyle(fontFamily: "Robo"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        hintText: 'Enter your age',
                        prefixIcon: Icon(
                          Icons.person_2_sharp,
                          color: Colors.orange,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                      ),
                      style: const TextStyle(fontFamily: "Robo"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        hintText: 'Enter your location',
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.orange,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                      ),
                      style: const TextStyle(fontFamily: "Robo"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () async {
                          String id = randomAlphaNumeric(6);
                          Map<String, dynamic> record = {
                            'FirstName': fNameController.text,
                            'LastName': lNameController.text,
                            'UserName': uNameController.text,
                            'Email': emailController.text,
                            'PhoneNumber': phoneController.text,
                            'Age': ageController.text,
                            'Location': locationController.text,
                            'Id': id,
                          };
                          bool allKeysValues = record.values
                              .every((value) => value != null && value != "");
                          if (allKeysValues) {
                            await Database().addRecord(record, id);
                            fNameController.clear();
                            lNameController.clear();
                            uNameController.clear();
                            emailController.clear();
                            phoneController.clear();
                            ageController.clear();
                            locationController.clear();
                            setState(() {});
                            await Fluttertoast.showToast(
                              msg: 'Record Added Successfully',
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                            );
                          } else {
                            await Fluttertoast.showToast(
                              msg: 'Please fill in all fields',
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                            );
                          }
                        },
                        child: const Text(
                          'Add Record',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
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
}
