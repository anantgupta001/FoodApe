import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, dynamic>?> data;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  Future<Map<String, dynamic>?> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.29.117:3000/messmenu'));
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
      backgroundColor:
          Color(0xFF1E1E1E), // Background color similar to the image
      body: Center(
        child: FutureBuilder<Map<String, dynamic>?>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.data == null) {
              return Text('No data available');
            } else {
              var messmenu = snapshot.data!['messmenu'];
              if (messmenu == null) {
                return Text('No menu available');
              }

              List<String> meals = ['Breakfast', 'Lunch', 'Snacks', 'Dinner'];
              int currentMealIndex = meals.indexOf(getCurrentMeal());
              currentMealIndex = currentMealIndex == -1 ? 0 : currentMealIndex;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Card(
                              color: Color(0xFFFA9D85), // Card background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Upcoming Meal',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      meal,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      (mealData['NonSpl'] as List<dynamic>? ?? []).join(', '),
                                      style: TextStyle(
                                        color: Colors.white,
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
         
                    // Lower card for the full menu
                    Card(
                      color: Color(0xFFFA9D85), // Card background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            buildMenuItem('Breakfast', messmenu['breakfast']),
                            buildMenuItem('Lunch', messmenu['lunch']),
                            buildMenuItem('Snacks', messmenu['snacks']),
                            buildMenuItem('Dinner', messmenu['dinner']),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View Full Menu',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              );
            }
          },
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meal,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            Text(
              (menu?['NonSpl'] as List<dynamic>? ?? []).join(', '),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              (menu?['Spl'] as List<dynamic>? ?? []).join(', '),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

}
