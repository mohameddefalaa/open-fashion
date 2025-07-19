import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/core/themes/darkthemecolors.dart';
import 'package:open_fashion/cubit/appstate.dart';

class Appcubit extends Cubit<Appstate> {
  Appcubit() : super(Appinitial());

  static Appcubit get(context) => BlocProvider.of(context);
  static bool isdark = true;
  void changetheme(bool newvalue) {
    if (isdark) {
      isdark = newvalue;
      print(isdark.toString());
      emit(Lihgttheme());
    } else {
      isdark = newvalue;
      print(isdark.toString());

      emit(Darktheme());
    }
  }
}
