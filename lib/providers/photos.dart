class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> parsedJson) {
    return Photo(
        id: parsedJson['id'],
        albumId: parsedJson['albumId'],
        title: parsedJson['ttile'],
        url: parsedJson['url'],
        thumbnailUrl: parsedJson['thumbnailUrl']);
  }
}

class PhotoList {
  final List<Photo> photos;

  PhotoList({this.photos});

  factory PhotoList.fromJson(List<dynamic> parsedJson) {
    List <Photo> photos = parsedJson.map((item) => Photo.fromJson(item)).toList();
    return PhotoList(photos: photos);
  }
}
