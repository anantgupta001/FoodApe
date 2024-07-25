import 'package:flutter/material.dart';
import 'package:food_ape/constants/theme.dart';
import 'package:food_ape/screens/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? emailError;

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
                  Text(
                    'Log In',
                    style: kDisplayLarge
                        .displayLarge, // or any other appropriate TextStyle
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sign into your existing account',
                    style: kBodyMedium
                        .bodyMedium, // or any other appropriate TextStyle
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
                            controller: emailController,
                            decoration: InputDecoration(
                              focusColor: kPrimaryColor,
                              fillColor: kCanvasColor,
                              labelText: 'EMAIL',
                              labelStyle: kBodyMedium.bodyMedium,
                              hintText: 'dumbfuck@gmail.com',
                              hintFadeDuration: Durations.long3,
                              hintStyle: kFadeBodyMedium.bodyMedium,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              errorText: emailError,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!_validateEmail(value)) {
                                return 'Enter a valid email address';
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
                              // focusedBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(color: kPrimaryColor),
                              // ),
                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(color: kPrimaryColor),
                              // ),
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
                                      // TODO: Implement remember me functionality
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
                                style: kBodyLarge
                                    .bodyLarge, // or any other appropriate TextStyle
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 260),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('Email: ${emailController.text}');
                                print('Password: ${passwordController.text}');
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
                              style: kDisplayMedium
                                  .displayMedium, // or any other appropriate TextStyle
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
                                style: kBodyMedium
                                    .bodyMedium, // or any other appropriate TextStyle
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
