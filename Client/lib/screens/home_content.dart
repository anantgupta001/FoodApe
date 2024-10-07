import 'dart:convert';
import 'package:food_ape/models/userModel.dart';
import 'package:food_ape/providers/user_provider.dart';
import 'package:food_ape/screens/blockScreen.dart';
import 'package:food_ape/screens/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_ape/constants/theme.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class Blocks {
  final IconData icon;
  final String name;

  Blocks({
    required this.icon,
    required this.name,
  });
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late Future<Map<String, dynamic>?> data;

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>?> fetchData(String username) async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.137.1:3000/home/user/$username'));
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

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? user = userProvider.user;
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

    if (user != null) {
      data = fetchData(user.username);
    } else {
      data = Future.value(null);
      // Handle the case where user is not available
    }

    return Scaffold(
      backgroundColor: k2ScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: k2ScaffoldBackgroundColor,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_on, color: kRustyRed),
            SizedBox(width: 8),
            Text('VIT-AP', style: kBodyMedium.bodyMedium),
            SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_down, color: kRustyRed),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_2_rounded),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<Map<String, dynamic>?>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(child: SkeletonListView());
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
                var homeData = snapshot.data!;
                String hostel = homeData['hostel'];
                String name = homeData['name'];
                String messType = homeData['messType'];
                var messMenu = homeData['messmenu'];
                List<dynamic> blocksList = homeData['blockData']['blocks'];
                List<String> blockNames = blocksList
                    .map((block) => block['name'].toString())
                    .toList();
                List<String> meals = ['Breakfast', 'Lunch', 'Snacks', 'Dinner'];
                int currentMealIndex = meals.indexOf(getCurrentMeal());
                currentMealIndex =
                    currentMealIndex == -1 ? 0 : currentMealIndex;

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Hostel: $hostel',
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              )),
                          SizedBox(width: 16),
                          Row(
                            children: [
                              Text('Mess Type: ',
                                  style: kBodyMedium.bodyMedium),
                              Text('$messType',
                                  style: GoogleFonts.playfairDisplay(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: messType == 'Veg'
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
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
                            var mealData = messMenu[meal.toLowerCase()] ?? {};
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
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Greetings ${name}!',
                        style: kDisplayLarge.displayLarge,
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: kRustyRed),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search dishes, restaurants',
                                  hintStyle: kFadeBodyMedium.bodyMedium,
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        child: Card(
                          color: k2ScaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: kRustyRed, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GridView.count(
                              crossAxisCount: 4,
                              shrinkWrap: true,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              children: blockNames.map((block) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BlockScreen(name: block)));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.cookie_rounded,
                                          // color: kPrimaryColor
                                          size: 40,
                                          color: kRustyRed,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          block,
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 12,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )
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

  Widget _buildMessMenu(Map<String, dynamic> messMenu) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMealSection('Breakfast', messMenu['breakfast']),
        _buildMealSection('Lunch', messMenu['lunch']),
        _buildMealSection('Snacks', messMenu['snacks']),
        _buildMealSection('Dinner', messMenu['dinner']),
      ],
    );
  }

  Widget _buildMealSection(String mealName, Map<String, dynamic> mealData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(mealName, style: kDisplayMedium.displayMedium),
        SizedBox(height: 8),
        Text('Non-Spl: ${mealData['NonSpl'].join(', ')}',
            style: kBodyMedium.bodyMedium),
        Text('Spl: ${mealData['spl'].join(', ')}',
            style: kBodyMedium.bodyMedium),
        SizedBox(height: 16),
      ],
    );
  }
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
