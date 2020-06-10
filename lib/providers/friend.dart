class Friend {
  String firstName;
  String lastName;
  int age;

  Friend({this.firstName, this.lastName, this.age});
  
  // fromJson -> Dart Object
  factory Friend.fromJson(Map<String, dynamic> parsedJson) {
    return Friend(
      firstName: parsedJson['firstName'],
      lastName: parsedJson['lastName'],
      age: parsedJson['age']
      );
  }

  // from DartObject -> Json
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'age': age,
    };
  }

  

}