import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_ape/models/userModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:food_ape/providers/user_provider.dart';
import 'package:food_ape/screens/home.dart';
import 'package:food_ape/screens/signup.dart';
import 'package:food_ape/constants/theme.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool obscurePassword = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? emailError;

  Future<bool> _login(String username, String password) async {
    try {
      var url = Uri.parse(
          'http://192.168.137.1:3000/auth/login'); // Use appropriate URL for emulator
      var client = http.Client();
      Map<String, String> data = {
        'username': username,
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
        var responseBody = jsonDecode(
            response.body); // Assuming response body contains user data
        print(
            'Response Body: $responseBody'); // Debugging line to print the response body

        if (responseBody != null && responseBody['status'] == true) {
          User user = User(
            username:
                username, // Using the provided username as the response does not return it
          );

          Provider.of<UserProvider>(context, listen: false).setUser(user);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
          return true;
        } else {
          print('Login failed: ${responseBody['message']}');
          _showErrorDialog(responseBody['message']);
          return false;
        }
      } else {
        print('Login failed with status code: ${response.statusCode}');
        _showErrorDialog('Login failed ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Exception caught: $e');
      _showErrorDialog('An error occurred. Please try again.');
      return false;
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kSecondaryColor,
          title: Text('Error'),
          content: Text(message, style: kBodyLarge.bodyLarge),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: GoogleFonts.playfairDisplaySc(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
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
                  Text(
                    'Log In',
                    style: kDisplayLarge.displayLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sign into your existing account',
                    style: kBodyMedium.bodyMedium,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  boxShadow: [kBoxShadow],
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              labelText: 'USERNAME',
                              labelStyle: kBodyMedium.bodyMedium,
                              hintText: '22XXX1234',
                              hintStyle: kFadeBodyMedium.bodyMedium,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              errorText: emailError,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: kBodyMedium.bodyMedium,
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
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: kRustyRed,
                                  fillColor:
                                      MaterialStateProperty.all(kCanvasColor),
                                  checkColor: kRustyRed,
                                  autofocus: true,
                                  focusColor: kRustyRed,
                                  side: BorderSide(color: kRustyRed),
                                  value: rememberMe,
                                  onChanged: (newValue) {
                                    setState(() {
                                      rememberMe = newValue!;
                                    });
                                  },
                                ),
                                Text('Remember me'),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: Implement forgot password functionality
                              },
                              child: Text(
                                'Forgot Password',
                                style: kBodyLarge.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 260),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                await _login(usernameController.text,
                                    passwordController.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'LOG IN',
                              style: kDisplayMedium.displayMedium,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: kBodyMedium.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: 'SIGN UP',
                                    style: GoogleFonts.playfairDisplay(
                                      textStyle: TextStyle(
                                        color: kRustyRed,
                                        fontWeight: FontWeight.bold,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
