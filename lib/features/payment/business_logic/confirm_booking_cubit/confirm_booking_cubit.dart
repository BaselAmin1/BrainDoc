import 'package:BrainDoc/core/di.dart';
import 'package:BrainDoc/features/payment/data/models/appointment_model.dart';
import 'package:BrainDoc/features/payment/data/models/dates_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'confirm_booking_state.dart';

class ConfirmBookingCubit extends Cubit<ConfirmBookingState> {
  ConfirmBookingCubit() : super(ConfirmAppointmentInitial());
  FirebaseAuth auth = getIt<FirebaseAuth>();

  FirebaseFirestore firestore = getIt<FirebaseFirestore>();
  Future makeAppointment({
    required AppointmentModel appointmentModel,
  }) async {
    emit(ConfirmAppointmentLoading());
    DocumentReference docRef = getIt<FirebaseFirestore>()
        .collection('appointments')
        .doc(auth.currentUser!.uid);
    String currentDate = appointmentModel.date!;
    String currentTime = appointmentModel.time!;

    currentDate = parseDateString(currentDate);

    TimeBokked timeBokked = TimeBokked(time: currentTime);

    DocumentSnapshot doctorSnapshot = await getIt<FirebaseFirestore>()
        .collection('doctors')
        .doc(appointmentModel.doctorId)
        .get();

    if (doctorSnapshot.exists) {
      List<dynamic>? datesData = doctorSnapshot['dates'];

      if (datesData != null) {
        List<dynamic> updatedDatesData = datesData.map((date) {
          if (date['weekDay'] == "Friday") {
            // Update the 'timeBokked' list for the matching date
            date['dateTimes'].forEach((dateTime) {
              if (dateTime['time'] == currentTime) {
                dateTime['timeBooked'].add(currentDate);
              }
            });
          }
          return date;
        }).toList();
        for (var element in updatedDatesData) {}
        await getIt<FirebaseFirestore>()
            .collection('doctors')
            .doc(appointmentModel.doctorId)
            .update({'dates': updatedDatesData});

        await docRef.get().then((docSnapshot) {
          if (docSnapshot.exists) {
            docRef.update({'list': appointmentModel.toJson()}).then((_) {
              emit(ConfirmAppointmentLoaded());
            }).catchError((error) {
              emit(ConfirmAppointmentError(error.toString()));
            });
          } else {
            docRef.set({
              'list': [appointmentModel.toJson()]
            }).then((_) {
              emit(ConfirmAppointmentLoaded());
            }).catchError((error) {
              emit(ConfirmAppointmentError(error.toString()));
            });
          }
        }).catchError((error) {
          emit(ConfirmAppointmentError(error.toString()));
        });
      }
    }
  }
}

String parseDateString(String dateString) {
  // Define the input format
  DateFormat inputFormat = DateFormat('E, MMM d, yyyy');

  // Parse the input date string
  DateTime date = inputFormat.parse(dateString);

  // Define the output format
  DateFormat outputFormat = DateFormat('yyyy-M-d');

  // Format the date to the desired format
  return outputFormat.format(date);
}
