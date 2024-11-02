class HomeModel {
  final String homeName;
  final String homeDescription;
  final String homeLocation;
  final String homeNeed;
  final List<String> images;
  final String? pdfUrl; // Added this line to store the PDF URL

  HomeModel({
    required this.homeName,
    required this.homeDescription,
    required this.homeLocation,
    required this.homeNeed,
    required this.images,
    this.pdfUrl, // Allowing this to be nullable
  });

  Map<String, dynamic> toMap() {
    return {
      'homeName': homeName,
      'homeDescription': homeDescription,
      'homeLocation': homeLocation,
      'homeNeed': homeNeed,
      'images': images,
      'pdfUrl': pdfUrl, // Include this in the map
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      homeName: map['homeName'] ?? '',
      homeDescription: map['homeDescription'] ?? '',
      homeLocation: map['homeLocation'] ?? '',
      homeNeed: map['homeNeed'] ?? '',
      images: List<String>.from(map['images'] ?? []),
      pdfUrl: map['pdfUrl'], // Deserialize PDF URL
    );
  }
}
