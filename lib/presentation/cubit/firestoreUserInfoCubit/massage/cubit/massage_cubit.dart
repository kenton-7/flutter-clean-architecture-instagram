import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/data/models/massage.dart';
import 'package:instagram/domain/usecases/firestoreUserUseCase/massage/add_massage.dart';

part 'massage_state.dart';

class MassageCubit extends Cubit<MassageState> {
  final AddMassageUseCase _addMassageUseCase;
  List<Massage> massagesInfo = [];
  MassageCubit(this._addMassageUseCase) : super(MassageInitial());

  static MassageCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> sendMassage(
      {required Massage massageInfo,
      String pathOfPhoto = "",
      String pathOfRecorded = ""}) async {
    emit(SendMassageLoading());
    await _addMassageUseCase
        .call(
            paramsOne: massageInfo,
            paramsTwo: pathOfPhoto,
            paramsThree: pathOfRecorded)
        .then((massageInfo) {
      emit(SendMassageLoaded(massageInfo));
    }).catchError((e) {
      emit(SendMassageFailed(e.toString()));
    });
  }
}
