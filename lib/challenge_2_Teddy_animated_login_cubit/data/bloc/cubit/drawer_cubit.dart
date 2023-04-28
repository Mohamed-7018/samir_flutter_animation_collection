import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  
  DrawerCubit() : super(DrawerInitial());

  
  static DrawerCubit get(BuildContext context) => BlocProvider.of(context);





  /*------------------------------------  Drawer  ------------------------------------*/

  double _sigma = 0.0;
  get sigma => _sigma;
  setBlurSigma(sigma) {
    _sigma = sigma;
    emit(ChangeSigma());
  }
}
