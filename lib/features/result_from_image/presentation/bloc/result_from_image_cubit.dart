import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/classes/state_status.dart';
import '../../domain/usecases/get_pediction_use_case.dart';
import 'result_from_image_states.dart';

@injectable
class ResultFromImageCubit extends Cubit<ResultFromImageStates> {
  ResultFromImageCubit(this.getPredictionUseCase)
    : super(ResultFromImageStates());
  final GetPredictionUseCase getPredictionUseCase;

  Future<void> getPrediction(File? image) async {
    emit(
      state.copyWith(
        getPredictionState: GetPredictionState(state: StateStatusEnum.loading),
      ),
    );
    final result = await getPredictionUseCase(image);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getPredictionState: GetPredictionState(
              state: StateStatusEnum.error,
              exception: failure.errorMessage,
            ),
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            getPredictionState: GetPredictionState(
              state: StateStatusEnum.success,
              data: data,
            ),
          ),
        );
      },
    );
  }
}
