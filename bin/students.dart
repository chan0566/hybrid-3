import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  void sort(String field) {
    people.sort((a, b) {
      return a[field]!.compareTo(b[field]!);
    });
  }

  void output() {
    for (var person in people) {
      print(person);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field) {
    people.removeWhere(
        (person) => person['first'] == field || person['last'] == field);
  }
}

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  var decodedList = jsonDecode(json);

  List<Map<String, String>> peopleList = [];
  for (var item in decodedList) {
    peopleList.add(Map<String, String>.from(item));
  }

  Students students = Students(peopleList);

  students.sort('last');
  students.output();

  students
      .plus({"first": "Jane", "last": "Doe", "email": "jane.doe@example.com"});
  students.output();

  students.remove("Shah");
  students.output();
}
