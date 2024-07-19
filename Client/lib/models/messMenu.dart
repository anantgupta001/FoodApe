class MessMenu {
  final String id;
  final String date;
  final String day;
  final Map<String, List<String>> breakfast;
  final Map<String, List<String>> lunch;
  final Map<String, List<String>> snacks;
  final Map<String, List<String>> dinner;

  MessMenu({
    required this.id,
    required this.date,
    required this.day,
    required this.breakfast,
    required this.lunch,
    required this.snacks,
    required this.dinner,
  });

  factory MessMenu.fromJson(Map<String, dynamic> json) {
    return MessMenu(
      id: json['_id'],
      date: json['date'],
      day: json['day'],
      breakfast: Map<String, List<String>>.from(json['breakfast']),
      lunch: Map<String, List<String>>.from(json['lunch']),
      snacks: Map<String, List<String>>.from(json['snacks']),
      dinner: Map<String, List<String>>.from(json['dinner']),
    );
  }
}
