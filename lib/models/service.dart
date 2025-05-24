class Service {
  final String title;
  final String description;
  final String iconPath;

  Service({
    required this.title,
    required this.description,
    required this.iconPath,
  });

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      title: map['title'] ?? 'No Title',
      description: map['description'] ?? 'No Description',
      iconPath: map['iconPath'] ?? 'assets/icons/default_icon.png',
    );
  }
}