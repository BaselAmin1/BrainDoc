import 'package:BrainDoc/features/payment/data/models/appointment_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentInitial());
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future makeAppointment(
    {
      required AppointmentModel appointmentModel,
    }
  ) async {
    emit(AppointmentLoading());
   

    DocumentReference docRef = FirebaseFirestore.instance
        .collection('appointments')
        .doc(auth.currentUser!.uid);

    docRef.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        docRef.update({
          'list': FieldValue.arrayUnion([appointmentModel.toJson()])
        }).then((_) {
          print('Data added to the list successfully!');
          emit(AppointmentLoaded());
        }).catchError((error) {
          print('Error adding data to the list: $error');
          emit(AppointmentError(error.toString()));
        });
      } else {
        docRef.set({
          'list': [appointmentModel.toJson()]
        }).then((_) {
          print('Document created with data!');
          emit(AppointmentLoaded());
        }).catchError((error) {
          print('Error creating document: $error');
          emit(AppointmentError(error.toString()));
        });
      }
    }).catchError((error) {
      print('Error getting document: $error');
      emit(AppointmentError(error.toString()));
    });
  }
}

