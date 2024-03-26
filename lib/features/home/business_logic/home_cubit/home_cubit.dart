import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(status: HomeStatus.initial));

  Future getDoctors() async {
    try {
      emit(const HomeState(status: HomeStatus.loading));

      final querySnapshot =
          await FirebaseFirestore.instance.collection('doctors').get();
      emit(HomeState(status: HomeStatus.loaded, doctors: querySnapshot.docs));
    } catch (e) {
      emit(const HomeState(status: HomeStatus.error));
    }
  }

  Future getBanners() async {
    try {
      emit(const HomeState(status: HomeStatus.loading));
      final querySnapshot =
          await FirebaseFirestore.instance.collection('banners').get();
      emit(HomeState(status: HomeStatus.loaded, banners: querySnapshot.docs));
    } catch (e) {
      emit(const HomeState(status: HomeStatus.error));
    }
  }
}
