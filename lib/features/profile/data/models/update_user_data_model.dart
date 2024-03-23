class UpdateUserDataModel {
  final String fullName;
  final String email;
  final String gender;

  final DateTime? birthDate;

  UpdateUserDataModel({
    required this.fullName,
    required this.email,
    required this.gender,

    this.birthDate,
  });

  factory UpdateUserDataModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserDataModel(
      fullName: json['fullName'],
      email: json['email'],
      gender: json['gender'],

      birthDate:
          json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'gender': gender,

      'birthDate': birthDate != null
          ? "${birthDate!.year}-${birthDate!.month}-${birthDate!.day}"
          : null,
    };
  }
}
