class Place {
  final int id;
  final String title;
  final String content;
  final String type;
  final String image;
  final List<String> media;

  const Place({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.image,
    required this.media,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'image') {
      return Place(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        type: json['type'],
        image: json['image'],
        media: [],
      );
    } else {
      return Place(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        type: json['type'],
        image: "",
        media: List<String>.from(json['media']),
      );
    }
  }
}
