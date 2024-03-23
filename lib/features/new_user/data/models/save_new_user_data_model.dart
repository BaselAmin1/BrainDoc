class SaveNewUserDataModel {
  final String fullName;
  final String email;
  final String gender;
  final String image;
  final DateTime? birthDate;

  SaveNewUserDataModel({
    required this.fullName,
    required this.email,
    required this.gender,
    required this.image,
    this.birthDate,
  });

  factory SaveNewUserDataModel.fromJson(Map<String, dynamic> json) {
    return SaveNewUserDataModel(
      fullName: json['fullName'],
      email: json['email'],
      gender: json['gender'],
      image: json['image'],
      birthDate:
          json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'gender': gender,
      'image': image,
      'birthDate': birthDate != null
          ? "${birthDate!.year}-${birthDate!.month}-${birthDate!.day}"
          : null,
    };
  }
}
