import 'package:equatable/equatable.dart';

import '../../../../core/config/classes/state_status.dart';

class ResultFromImageStates extends Equatable{
  final GetPredictionState? getPredictionState;
  const ResultFromImageStates({this.getPredictionState});

  ResultFromImageStates copyWith({GetPredictionState? getPredictionState}) {
    return ResultFromImageStates(
      getPredictionState: getPredictionState ?? this.getPredictionState,
    );
  }

  @override
  List<Object?> get props => [
    getPredictionState,
  ];
}

class GetPredictionState extends StateStatus<String> {
  const GetPredictionState({required super.state, super.data, super.exception});
  @override
  List<Object?> get props => [state, data, exception];
}