import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_ape/constants/theme.dart';
import 'package:food_ape/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String profileImage =
      'https://i.pinimg.com/736x/ab/43/fc/ab43fce42207e54e55fc6183c5cdd59e.jpg'; // Replace with your profile image URL

  Future<void> _logout() async {
    final url = 'http://192.168.137.1:3000/auth/logout'; // Your logout endpoint
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    if(responseData['status'] == false){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('You are not logged in'),
            TextButton(onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to login page
              );
            }, child: Text('Login', style: GoogleFonts.playfairDisplaySc(color: kRustyRed, fontWeight: FontWeight.bold))),
          ],
        )),
      );
      return;
    }
    if (response.statusCode == 200) {
      
      if (responseData['status']) {
        // Successfully logged out
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to login page
        );
      } else {
        // Logout failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout failed: ${responseData['message']}')),
        );
      }
    } else {
      // Network error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error, please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: k2ScaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kRustyRed,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Profile',
          style: kDisplayLarge.displayLarge,
        ),
        centerTitle: true,
        backgroundColor: k2ScaffoldBackgroundColor,
      ),
      backgroundColor: k2ScaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Profile Section
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
                width: 2,
              ),
              color: Color.fromARGB(0, 172, 176, 195),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Stack(
                            children: [
                              // Blurred background
                              Positioned.fill(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              // Enlarged profile image
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Image.network(
                                    profileImage, // Replace with your profile image URL
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kRustyRed,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
                      child: Image.network(
                        profileImage,
                        width: 100, // Adjust the width as needed
                        height: 100, // Adjust the height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  'Test Name', // Replace with your user name
                  style: GoogleFonts.playfairDisplay(
                    color: kRustyRed,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // List Items
          buildListItem(context, Icons.person_2_rounded, 'Edit Profile'),
          buildListItem(context, Icons.map_rounded, 'Addresses'),
          buildListItem(context, Icons.shopping_cart_rounded, 'Cart'),
          buildListItem(context, Icons.favorite_outline_rounded, 'Favourite'),
          buildListItem(context, Icons.notifications_rounded, 'Notifications'),
          buildListItem(context, Icons.payment_rounded, 'Payment Method'),

          // Separator Line
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            height: 2,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromARGB(157, 88, 88, 88),
            ),
          ),

          buildListItem(context, Icons.help_outline_rounded, 'FAQs'),
          buildListItem(context, Icons.info_outline_rounded, 'About'),
          buildListItem(
              context, Icons.settings_applications_rounded, 'Settings'),

          // Separator Line
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            height: 2,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromARGB(157, 88, 88, 88),
            ),
          ),

          InkWell(
            onTap: _logout,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: kScaffoldBackgroundColor,
                    size: 40,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: kCosmicLatte,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: kCosmicLatte),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListItem(BuildContext context, IconData icon, String title) {
    return InkWell(
      onTap: () {
        // Handle the onTap event
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(0, 172, 176, 195),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: kRustyRed,
              size: 40,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
