class EnrollModal {
  final String enrollerPersonName;
  final String enrollerPersonDescription;
  final String enrollerType;
  final String enrollerProfileImages;
  final String enrollingDate;

  EnrollModal({
    required this.enrollerPersonName,
    required this.enrollerPersonDescription,
    required this.enrollerType,
    required this.enrollerProfileImages,
    required this.enrollingDate,
  });

  // Convert EnrollModal instance to a map
  Map<String, dynamic> toMap() {
    return {
      'enrollerPersonName': enrollerPersonName,
      'enrollerPersonDescription': enrollerPersonDescription,
      'enrollerType': enrollerType,
      'enrollerProfileImages': enrollerProfileImages,
      'enrollingDate': enrollingDate,
    };
  }

  // Create an EnrollModal instance from a map
  factory EnrollModal.fromMap(Map<String, dynamic> map) {
    return EnrollModal(
      enrollerPersonName: map['enrollerPersonName'] ?? '',
      enrollerPersonDescription: map['enrollerPersonDescription'] ?? '',
      enrollerType: map['enrollerType'] ?? '',
      enrollerProfileImages: map['enrollerProfileImages'] ?? '',
      enrollingDate: map['enrollingDate'] ?? '',
    );
  }
}
