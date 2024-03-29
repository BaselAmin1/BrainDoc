import 'package:BrainDoc/core/di.dart';
import 'package:BrainDoc/core/functions/easy_loading.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(AppointmentsInitial());
  FirebaseFirestore firestore = getIt<FirebaseFirestore>();
  Reference ref = getIt<FirebaseStorage>().ref();
  List pastAppointments = [];
  List currentAppointments = [];
  Future getAppointments() async {
    emit(GetAppointmentsLoading());
    pastAppointments = [];
    currentAppointments = [];
    try {
      DocumentSnapshot snapshot = await firestore
          .collection('appointments')
          .doc(getIt<FirebaseAuth>().currentUser!.uid)
          .get();

      if (snapshot.exists) {
        for (var appointment in snapshot['list']) {
          if ((DateFormat("E, MMM dd, yyyy").parse(appointment['date']))
              .isBefore(DateTime.now())) {
            pastAppointments.add(appointment);
          } else {
            currentAppointments.add(appointment);
          }
        }

        emit(GetAppointmentsLoaded());
      } else {
        throw Exception('Appointments not found');
      }
    } catch (e) {
      emit(GetAppointmentsError(e.toString()));
    }
  }

  Future addRating({
    required String rating,
    required appointment,
    String? review,
  }) async {
    emit(AddRatingLoading());
    showLoading();
    try {
      await firestore
          .collection('doctors')
          .doc(appointment['doctorId'])
          .update({
        'reviews': FieldValue.arrayUnion([
          {
            'patientId': getIt<FirebaseAuth>().currentUser!.uid,
            'patientRating': rating,
            'patientReview': review ?? '',
            'patientName': getIt<FirebaseAuth>().currentUser!.displayName,
            'patientImage': getIt<FirebaseAuth>().currentUser!.photoURL,
            'date': DateFormat('yyyy-M-d').format(DateTime.now()).toString()
          }
        ])
      });
      await firestore
          .collection('appointments')
          .doc(getIt<FirebaseAuth>().currentUser!.uid)
          .update({
        'list': FieldValue.arrayUnion([
          {
            'doctorId': appointment['doctorId'],
            'rating': rating,
            'review': review ?? '',
            'date': appointment['date'],
            'time': appointment['time'],
            'notes': appointment['notes'],
            'isVisa': appointment['isVisa'],
            'totalPrice': appointment['totalPrice'],
            'doctorImage': appointment['doctorImage'],
            'patientImage': appointment['patientImage'],
            'doctorName': appointment['doctorName'],
            'userName': appointment['userName'],
            'userId': appointment['userId'],
          }
        ])
      });
      await firestore
          .collection('appointments')
          .doc(getIt<FirebaseAuth>().currentUser!.uid)
          .update({
        'list': FieldValue.arrayRemove([
          {
            'doctorId': appointment['doctorId'],
            'rating': appointment['rating'],
            'review': appointment['review'],
            'date': appointment['date'],
            'time': appointment['time'],
            'notes': appointment['notes'],
            'isVisa': appointment['isVisa'],
            'totalPrice': appointment['totalPrice'],
            'doctorImage': appointment['doctorImage'],
            'patientImage': appointment['patientImage'],
            'doctorName': appointment['doctorName'],
            'userName': appointment['userName'],
            'userId': appointment['userId'],
          }
        ])
      });
      await getAppointments();
      showSuccess('reviewAdded'.tr());
      emit(AddRatingLoaded());
    } catch (e) {
      emit(AddRatingError(e.toString()));
    }
  }
}
