import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future getDoctors() async {
    try {
      emit(GetDoctorsLoading());

      final querySnapshot =
          await FirebaseFirestore.instance.collection('doctors').get();
      emit(GetDoctorsSuccess(querySnapshot.docs));
    } catch (e) {
      emit(GetDoctorsFailure(e.toString()));
    }
  }
    Future getBanners() async {
    try {
      emit(GetBannersLoading());

      final querySnapshot =
          await FirebaseFirestore.instance.collection('banners').get();
      emit(GetBannersSuccess(querySnapshot.docs));
    } catch (e) {
      emit(GetBannersFailure(e.toString()));
    }
  }
}
