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
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future makeAppointment({
    required AppointmentModel appointmentModel,
  }) async {
    emit(ConfirmAppointmentLoading());
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('appointments')
        .doc(auth.currentUser!.uid);
    String currentDate = appointmentModel.date!;
    String currentTime = appointmentModel.time!;
    print("time");
    print(currentTime);
    print('date');
    print(currentDate);
    print("after");
    currentDate = parseDateString(currentDate);
    print(currentDate);

    TimeBokked timeBokked = TimeBokked(time: currentTime);

    DocumentSnapshot doctorSnapshot = await FirebaseFirestore.instance
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
              print(dateTime['time'] == currentTime);
              if (dateTime['time'] == currentTime) {
                print(dateTime['timeBooked']);
                print("timeBokked");
                dateTime['timeBooked'].add(currentDate);
              }
            });
          }
          return date;
        }).toList();
        for (var element in updatedDatesData) {
          print(element);
          print("---");
        }
        await FirebaseFirestore.instance
            .collection('doctors')
            .doc(appointmentModel.doctorId)
            .update({'dates': updatedDatesData});

        await docRef.get().then((docSnapshot) {
          if (docSnapshot.exists) {
            docRef.update({
              'list': FieldValue.arrayUnion([appointmentModel.toJson()])
            }).then((_) {
              print('Data added to the list successfully!');
              emit(ConfirmAppointmentLoaded());
            }).catchError((error) {
              print('Error adding data to the list: $error');
              emit(ConfirmAppointmentError(error.toString()));
            });
          } else {
            docRef.set({
              'list': [appointmentModel.toJson()]
            }).then((_) {
              print('Document created with data!');
              emit(ConfirmAppointmentLoaded());
            }).catchError((error) {
              print('Error creating document: $error');
              emit(ConfirmAppointmentError(error.toString()));
            });
          }
        }).catchError((error) {
          print('Error getting document: $error');
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
