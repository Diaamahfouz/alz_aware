import 'package:alz_aware/features/questions/presentation/bloc/questions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionsState> {
  /// Returns the maximum possible score for the test
  int get maxScore {
    // Type 0: 5 questions, 1pt each
    // Type 1: 5 questions, 2pt each
    // Type 2: 5 questions, 3pt each
    // If you add more types/questions, update this logic accordingly
    return (getQuestionCount(0) * 1) +
        (getQuestionCount(1) * 2) +
        (getQuestionCount(2) * 3);
  }

  /// Returns the percentage result of the assessment (0-100)
  double get resultPercentage {
    if (maxScore == 0) return 0;
    return (totalScore / maxScore) * 100;
  }

  /// Helper to get the number of questions for a type
  int getQuestionCount(int type) {
    // You may want to move this logic to a config or pass it from the UI
    switch (type) {
      case 0:
        return 5; // Early
      case 1:
        return 5; // Moderate
      case 2:
        return 5; // Late
      default:
        return 0;
    }
  }

  // Get the total score for a type (type 0: 1pt, type 1: 2pt, type 2: 3pt)
  int getTypeScore(int type) {
    final answersForType = answers[type] ?? {};
    final point = type == 0
        ? 1
        : type == 1
        ? 2
        : 3;
    return answersForType.values.where((v) => v).length * point;
  }

  // Get the total score for all types (0, 1, 2)
  int get totalScore => getTypeScore(0) + getTypeScore(1) + getTypeScore(2);

  // Check if all questions in a type are answered
  bool isTypeComplete(int type, int questionCount) {
    final answersForType = answers[type] ?? {};
    return answersForType.length == questionCount &&
        !answersForType.values.contains(null);
  }

  QuestionsCubit() : super(QuestionsInitial());

  // Map: type -> Map<index, answer>
  final Map<int, Map<int, bool>> answers = {};

  // Set all answers for a type to true
  void answerAllTrue({required int type, required int questionCount}) {
    answers[type] = answers[type] ?? {};
    for (int i = 0; i < questionCount; i++) {
      answers[type]![i] = true;
    }
    emit(ChangeQuestionsDegreeState());
  }

  // Set all answers for a type to false
  void answerAllFalse({required int type, required int questionCount}) {
    answers[type] = answers[type] ?? {};
    for (int i = 0; i < questionCount; i++) {
      answers[type]![i] = false;
    }
    emit(ChangeQuestionsDegreeState());
  }

  // Set answer for a specific question
  void answerQuestion({
    required int type,
    required bool answer,
    required int index,
  }) {
    answers[type] = answers[type] ?? {};
    answers[type]![index] = answer;
    emit(ChangeQuestionsDegreeState());
  }

  // Get answer for a specific question (returns null if unanswered)
  bool? getAnswer({required int type, required int index}) {
    return answers[type]?[index];
  }
}
