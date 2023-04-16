import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentVideoCubit extends Cubit<int> {
  CurrentVideoCubit() : super(0);

  void setCurrentVideoIndex(int index) {
    emit(index);
  }
}
