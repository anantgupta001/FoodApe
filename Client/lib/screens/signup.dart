import 'package:flutter/material.dart';
import 'package:food_ape/constants/theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController regNoController = TextEditingController();
  TextEditingController messTypeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  String hostelController = "";
  TextEditingController passwordController = TextEditingController();
  TextEditingController roomNoController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  String? dropdownValue;
  bool isHosteler = false;
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kCanvasColor,
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'EMAIL',
                            hintText: 'something@vitapstudent.ac.in',
                            hintStyle: kFadeBodyMedium.bodyLarge,
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
                          controller: mobileController,
                          decoration: InputDecoration(
                            labelText: 'MOBILE',
                            hintText: 'Enter your mobile number',
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
                            value: dropdownValue,
                            hint: Text('Hosteler / Day Scholar'),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: kBodyLarge.bodyLarge,
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
                                  style: kBodyLarge.bodyLarge,
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
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: kCosmicLatte,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: null,
                                          hint: Text(
                                            'Choose your Hostel',
                                            style: kBodyMedium.bodyMedium,
                                          ),
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.black),
                                          onChanged: (String? newValue) {},
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
                                    SizedBox(height: 20),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: kCanvasColor,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: null,
                                          hint: Text(
                                            'Choose your Mess',
                                            style: kBodyMedium.bodyMedium,
                                          ),
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.black),
                                          onChanged: (String? newValue) {},
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
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kCanvasColor,
                                ),
                                child: TextField(
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
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
                        child: RichText(
                          text: TextSpan(
                            text: "Have an existing account? ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: 'LOG IN', style: kBodyLarge.bodyLarge),
                            ],
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
