import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_ape/constants/theme.dart';
import 'package:food_ape/screens/login.dart';
import 'package:food_ape/screens/messMenu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController regNoController = TextEditingController();
  String messTypeController = "";
  TextEditingController usernameController = TextEditingController();
  String hostelController = "";
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool obscurePassword = true;
  String? dropdownValue;
  bool isHosteler = false;
  String? emailError;
  String validationFlag = '';
  Future<void> _signUp(String email, String password, String mobile,
      String regNo, String name, String messType, String hostel) async {
    try {
      var url = Uri.parse(
          'http://192.168.137.1:3000/auth/signup'); // Use appropriate URL for emulator
      var client = http.Client();
      Map<String, String> data = {
        'regNo': regNo,
        'isHosteler': isHosteler.toString(),
        'username': regNo,
        'email': email,
        'mobile': mobile,
        'hostel': hostel,
        'name': name,
        'messType': messType,
        'password': password,
      };
      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: data, // Encode the data as URL-encoded
      );

      if (response.statusCode == 200) {
        print('SignUp successful');
        validationFlag = 'success';
      } else if (response.statusCode == 400) {
        print('User already exists');
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            backgroundColor: kSecondaryColor,
            title: Text('Sign Up failed' , style: kBodyMedium.bodyMedium),
            content: Text('User already exists', style: kBodyLarge.bodyLarge,),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK', style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ],
          );
        });
        validationFlag = 'failure - user exists';
      } else {
        print('SignUp failed ${response.statusCode}');
        validationFlag = 'failure - unknown';
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  bool _validateEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email)) {
      setState(() {
        emailError = 'Enter a valid email address';
      });
      return false;
    } else {
      setState(() {
        emailError = null;
      });
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 170),
                  Text('Sign Up', style: kDisplayLarge.displayLarge),
                  SizedBox(height: 10),
                  Text('Sign up for a new account',
                      style: kFadeBodyMedium.bodyMedium),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kCanvasColor,
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'EMAIL',
                            hintText: 'something@vitapstudent.ac.in',
                            hintStyle: kFadeBodyMedium.bodyMedium,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            errorText: emailError,
                            errorStyle: kBodyLarge.bodyLarge,
                          ),
                          onChanged: (value) {
                            _validateEmail(value);
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kCanvasColor,
                        ),
                        child: TextField(
                          controller: mobileController,
                          decoration: InputDecoration(
                            labelText: 'MOBILE',
                            hintText: 'Enter your mobile number',
                            hintStyle: kFadeBodyMedium.bodyMedium,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kCanvasColor,
                        ),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your name',
                            hintStyle: kFadeBodyMedium.bodyMedium,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kCanvasColor,
                        ),
                        child: TextField(
                          controller: regNoController,
                          decoration: InputDecoration(
                            labelText: 'REG. NO.',
                            hintText: 'Enter your Registration number',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kCanvasColor,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            hint: Text('Hosteler / Day Scholar'),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: kBodyMedium.bodyMedium,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                isHosteler = dropdownValue == 'HOSTELER';
                              });
                            },
                            items: <String>['HOSTELER', 'DAY SCHOLAR']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: kBodyMedium.bodyMedium,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: Column(
                            children: [
                              Visibility(
                                visible: isHosteler,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: kCosmicLatte,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: hostelController.isEmpty
                                                ? null
                                                : hostelController,
                                            hint: Text(
                                              'Choose your Hostel',
                                              style: kBodyMedium.bodyMedium,
                                            ),
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconSize: 24,
                                            elevation: 16,
                                            style:
                                                TextStyle(color: Colors.black),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                hostelController =
                                                    newValue ?? '';
                                              });
                                            },
                                            items: <String>[
                                              'MH-1',
                                              'MH-2',
                                              'MH-3',
                                              'MH-4',
                                              'MH-5',
                                              'LH-1',
                                              'LH-2',
                                              'LH-3',
                                              'CB'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: kBodyMedium.bodyMedium,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: kCanvasColor,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: messTypeController.isEmpty
                                                ? null
                                                : messTypeController,
                                            hint: Text(
                                              'Choose your Mess',
                                              style: kBodyMedium.bodyMedium,
                                            ),
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconSize: 24,
                                            elevation: 16,
                                            style:
                                                TextStyle(color: Colors.black),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                messTypeController =
                                                    newValue ?? '';
                                              });
                                            },
                                            items: <String>[
                                              'Veg',
                                              'Non-Veg',
                                              'Special'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: kBodyMedium.bodyMedium,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 16),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: kCanvasColor,
                      //   ),
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton<String>(
                      //       isExpanded: true,
                      //       value: dropdownValue,
                      //       hint: Text('Hosteler / Day Scholar'),
                      //       icon: Icon(Icons.arrow_drop_down),
                      //       iconSize: 24,
                      //       elevation: 16,
                      //       style: kBodyMedium.bodyMedium,
                      //       onChanged: (String? newValue) {
                      //         setState(() {
                      //           dropdownValue = newValue;
                      //           isHosteler = dropdownValue == 'HOSTELER';
                      //         });
                      //       },
                      //       items: <String>['HOSTELER', 'DAY SCHOLAR']
                      //           .map<DropdownMenuItem<String>>((String value) {
                      //         return DropdownMenuItem<String>(
                      //           value: value,
                      //           child: Text(
                      //             value,
                      //             style: kBodyMedium.bodyMedium,
                      //           ),
                      //         );
                      //       }).toList(),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: AnimatedSize(
                      //     duration: Duration(milliseconds: 300),
                      //     curve: Curves.easeInOut,
                      //     child: Column(
                      //       children: [
                      //         Visibility(
                      //           visible: isHosteler,
                      //           child: Column(
                      //             children: [
                      //               Row(
                      //                 children: [
                      //                   Expanded(
                      //                     child: Container(
                      //                       padding: EdgeInsets.symmetric(
                      //                           horizontal: 16),
                      //                       decoration: BoxDecoration(
                      //                         borderRadius:
                      //                             BorderRadius.circular(10),
                      //                         color: kCosmicLatte,
                      //                       ),
                      //                       child: DropdownButtonHideUnderline(
                      //                         child: DropdownButton<String>(
                      //                           value: hostelController.isEmpty
                      //                               ? null
                      //                               : hostelController,
                      //                           hint: Text(
                      //                             'Choose your Hostel',
                      //                             style: kBodyMedium.bodyMedium,
                      //                           ),
                      //                           icon: Icon(Icons.arrow_drop_down),
                      //                           iconSize: 24,
                      //                           elevation: 16,
                      //                           style: TextStyle(
                      //                               color: Colors.black),
                      //                           onChanged: (String? newValue) {
                      //                             setState(() {
                      //                               hostelController =
                      //                                   newValue ?? '';
                      //                             });
                      //                           },
                      //                           items: <String>[
                      //                             'MH-1',
                      //                             'MH-2',
                      //                             'MH-3',
                      //                             'MH-4',
                      //                             'MH-5',
                      //                             'LH-1',
                      //                             'LH-2',
                      //                             'LH-3',
                      //                             'CB'
                      //                           ].map<DropdownMenuItem<String>>(
                      //                               (String value) {
                      //                             return DropdownMenuItem<String>(
                      //                               value: value,
                      //                               child: Text(
                      //                                 value,
                      //                                 style: kBodyMedium
                      //                                     .bodyMedium,
                      //                               ),
                      //                             );
                      //                           }).toList(),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   SizedBox(width: 20),
                      //                   Expanded(
                      //                     child: Container(
                      //                       decoration: BoxDecoration(
                      //                         borderRadius:
                      //                             BorderRadius.circular(10),
                      //                         color: kCanvasColor,
                      //                       ),
                      //                       child: TextField(
                      //                         controller: roomNoController,
                      //                         decoration: InputDecoration(
                      //                           labelText: 'ROOM NO.',
                      //                           border: InputBorder.none,
                      //                           contentPadding:
                      //                               EdgeInsets.symmetric(
                      //                                   horizontal: 16,
                      //                                   vertical: 12),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               SizedBox(height: 20),
                      //               Container(
                      //                 padding: EdgeInsets.symmetric(
                      //                     horizontal: 16),
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(10),
                      //                   color: kCanvasColor,
                      //                 ),
                      //                 child: DropdownButtonHideUnderline(
                      //                   child: DropdownButton<String>(
                      //                     value: messTypeController.isEmpty
                      //                         ? null
                      //                         : messTypeController,
                      //                     hint: Text(
                      //                       'Choose your Mess',
                      //                       style: kBodyMedium.bodyMedium,
                      //                     ),
                      //                     icon: Icon(Icons.arrow_drop_down),
                      //                     iconSize: 24,
                      //                     elevation: 16,
                      //                     style:
                      //                         TextStyle(color: Colors.black),
                      //                     onChanged: (String? newValue) {
                      //                       setState(() {
                      //                         messTypeController =
                      //                             newValue ?? '';
                      //                       });
                      //                     },
                      //                     items: <String>[
                      //                       'Veg',
                      //                       'Non-Veg',
                      //                       'Special'
                      //                     ].map<DropdownMenuItem<String>>(
                      //                         (String value) {
                      //                       return DropdownMenuItem<String>(
                      //                         value: value,
                      //                         child: Text(
                      //                           value,
                      //                           style: kBodyMedium.bodyMedium,
                      //                         ),
                      //                       );
                      //                     }).toList(),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kCanvasColor,
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            suffixIcon: IconButton(
                              icon: Icon(obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()  {
                            _signUp(
                              emailController.text, 
                              passwordController.text, 
                              mobileController.text, 
                              regNoController.text, 
                              nameController.text, 
                              messTypeController, 
                              hostelController);
                            if(validationFlag == 'success') {
                              //
                            if (_validateEmail(emailController.text)) {
                              // got to the Home Page
                              // Navigator.popAndPushNamed(context, '/home');
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));

                              // Implement your sign-up logic Here
                              print('Email: ${emailController.text}');
                              print('Mobile: ${mobileController.text}');
                              print('Reg. No: ${regNoController.text}');
                              print('Username: ${usernameController.text}');
                              print('Hostel: $hostelController');
                              print('Name: ${nameController.text}');
                              print('Mess Type: $messTypeController');
                              print('Password: ${passwordController.text}');
                            }
                            }else if(validationFlag == 'failure - unknown') {
                              
                              print('Sign Up failed');
                            }else if(validationFlag == 'failure - user exists') {
                              
                              print('Sign Up failed');
                            }else{
                              
                              print('Sign Up failed');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('SIGN UP',
                              style: kDisplayMedium.displayMedium),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Have an existing account? ",
                              style: kBodyMedium.bodyMedium,
                              children: [
                                TextSpan(
                                  text: 'LOG IN',
                                  style: kBodyLarge.bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
