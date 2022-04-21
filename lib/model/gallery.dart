class Gallery {
  final String caption;
  final String thumbnail;
  final String image;

  const Gallery({
    required this.caption,
    required this.thumbnail,
    required this.image,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      caption: json['caption'],
      thumbnail: json['thumbnail'],
      image: json['image'],
    );
  }
}
