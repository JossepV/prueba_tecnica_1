class GridItemModel {
  final String title;
  final String imageUrl;
  final bool isMostLiked;
  final bool isMostViewed;
  final String description;
  final String date;
  final String likes;

  GridItemModel({
    required this.isMostLiked,
    required this.isMostViewed,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.date,
    required this.likes,
  });
}
