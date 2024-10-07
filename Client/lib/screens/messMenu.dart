import 'package:flutter/material.dart';
import 'package:food_ape/constants/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class MessMenuPage extends StatefulWidget {
  @override
  _MessMenuPageState createState() => _MessMenuPageState();
}

class _MessMenuPageState extends State<MessMenuPage> {
  late Future<Map<String, dynamic>?> data;
  final Uri _url = Uri.parse(
      'https://docs.google.com/spreadsheets/d/1ZBca-NZ5V_N0NwJ5t5Y5dpb5XFCZqRQYAXddU77M07U/edit');
  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  Future<Map<String, dynamic>?> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.137.1:3000/messmenu'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  String getCurrentMeal() {
    final now = DateTime.now();
    if (now.hour >= 1 && now.hour < 9) {
      return 'Breakfast';
    } else if (now.hour >= 9 && now.hour < 14) {
      return 'Lunch';
    } else if (now.hour >= 17 && now.hour < 18.5) {
      return 'Snacks';
    } else if (now.hour >= 18.5 && now.hour < 21) {
      return 'Dinner';
    }
    return 'No Meal';
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
          'Mess Menu',
          style: kDisplayLarge.displayLarge,
        ),
        centerTitle: true,
        backgroundColor: k2ScaffoldBackgroundColor,
      ),
      backgroundColor:
          k2ScaffoldBackgroundColor, // Background color similar to the image
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<Map<String, dynamic>?>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data == null) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Failed to load data'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              } else {
                var messmenu = snapshot.data!['messmenu'];
                if (messmenu == null) {
                  return Text('No menu available');
                }

                List<String> meals = ['Breakfast', 'Lunch', 'Snacks', 'Dinner'];
                int currentMealIndex = meals.indexOf(getCurrentMeal());
                currentMealIndex =
                    currentMealIndex == -1 ? 0 : currentMealIndex;

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // this url opens the menu in the browser
                            _launchUrl();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View Full Menu',
                                style: GoogleFonts.playfairDisplay(
                                  textStyle: TextStyle(
                                    color: kCanvasColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.open_in_full_rounded,
                                color: kCanvasColor,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Upcoming Meal card with horizontal scroll
                      Container(
                        height: 200, // Adjust height as needed
                        child: PageView.builder(
                          itemCount: meals.length,
                          controller: PageController(
                            initialPage: currentMealIndex,
                            viewportFraction: 0.8,
                          ),
                          itemBuilder: (context, index) {
                            String meal = meals[index];
                            var mealData = messmenu[meal.toLowerCase()] ?? {};
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Card(
                                shadowColor: kPrimaryColor.withOpacity(0.0),
                                color: kSecondaryColor, // Card background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Upcoming Meal',
                                        style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              color: const Color.fromARGB(
                                                  129, 0, 0, 0),
                                              offset: Offset(1, 1),
                                              blurRadius: 3,
                                            ),
                                          ],
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        meal,
                                        style: TextStyle(
                                          color: kRustyRed,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        (mealData['NonSpl'] as List<dynamic>? ??
                                                [])
                                            .join(', '),
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        (mealData['spl'] as List<dynamic>? ?? [])
                                            .join(', '),
                                        style: TextStyle(
                                          color: kRustyRed,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Lower card for the full menu
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: kSecondaryColor, // Card background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                buildMenuItem(
                                    'Breakfast', messmenu['breakfast']),
                                buildMenuItem('Lunch', messmenu['lunch']),
                                buildMenuItem('Snacks', messmenu['snacks']),
                                buildMenuItem('Dinner', messmenu['dinner']),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(String meal, Map<String, dynamic>? menu) {
    String time = '';
    if (meal == 'Breakfast') time = '7:45 AM - 8:45 AM';
    if (meal == 'Lunch') time = '12:45 PM - 1:45 PM';
    if (meal == 'Snacks') time = '5:30 PM - 6:30 PM';
    if (meal == 'Dinner') time = '7:45 PM - 9:00 PM';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
                Text(
                  (menu?['NonSpl'] as List<dynamic>? ?? []).join(', '),
                  style: TextStyle(
                    color: kRustyRed,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  (menu?['Spl'] as List<dynamic>? ?? []).join(', '),
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
