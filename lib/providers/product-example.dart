
class Image {
  final int id;
  final String name;

  Image({this.id, this.name});

  factory Image.fromJson(Map<String, dynamic> parsedJson) {
    return Image(id: parsedJson['id'], name: parsedJson['name']);
  }
}

class Product {
  final int id;
  final String name;
  final List<Image> images;

  Product({this.id, this.name, this.images});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['images'] as List;

    List<Image> imagesList = list.map((i) => Image.fromJson(i)).toList();

    return Product(id: parsedJson['id'], name: parsedJson['name'], images: imagesList );
  }
}