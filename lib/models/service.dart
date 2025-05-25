class Service {
  final String title;
  final String description;
  final String iconPath;
  final String bannerPath;

  Service({
    required this.title,
    required this.description,
    required this.iconPath,
    required this.bannerPath,
  });

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      title: map['title'] ?? 'No Title',
      description: map['description'] ?? 'No Description',
      iconPath: map['iconPath'] ?? 'assets/icons/default_icon.png',
      bannerPath: map['bannerPath'] ?? 'assets/banners/default_background.png',
    );
  }
}
