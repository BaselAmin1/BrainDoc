import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());
  static MainLayoutCubit get(context) => BlocProvider.of(context);
  int mainLayoutInitialScreenIndex = 0;
  void changeBottomNavBar(index) {
    mainLayoutInitialScreenIndex = index;
    emit(AppBottomNavState(mainLayoutInitialScreenIndex));
  }
}
