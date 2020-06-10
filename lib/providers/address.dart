class Address{
 final  String city;
 final List<String> streets;

Address({this.city, this.streets});

factory Address.fromJson(Map<String, dynamic> parsedJson) {
    var streetsFromJson  = parsedJson['streets'];
    List<String> streetsList = streetsFromJson.cast<String>();

  return new Address(city: parsedJson['city'], streets: streetsList);
}
}