class AppointmentModel {
  final String? userName;
  final String? userId;
  final String? doctorName;
  final String? doctorId;
  final String? date;
  final String? time;
  final String? notes;
  final String? rating;
  final String? review;
  final bool? isVisa;
  final String? totalPrice;

  AppointmentModel({
    this.userName,
    this.userId,
    this.doctorName,
    this.doctorId,
    this.date,
    this.time,
    this.notes,
    this.rating,
    this.review,
    this.isVisa,
    this.totalPrice,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      userName: json['userName'],
      userId: json['userId'],
      doctorName: json['doctorName'],
      doctorId: json['doctorId'],
      date: json['date'],
      time: json['time'],
      notes: json['notes'],
      rating: json['rating'],
      review: json['review'],
      isVisa: json['isVisa'],
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userId': userId,
      'doctorName': doctorName,
      'doctorId': doctorId,
      'date': date,
      'time': time,
      'notes': notes,
      'rating': rating,
      'review': review,
      'isVisa': isVisa,
      'totalPrice': totalPrice,
    };
  }
}
