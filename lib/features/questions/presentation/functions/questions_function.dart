// Early stage questions for cognitive assessment
import 'package:alz_aware/core/routes/app_router_imports.dart';
import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/features/questions/presentation/widgets/questions_result/moderate_high_result.dart';
import 'package:alz_aware/features/questions/presentation/widgets/questions_result/normal_result.dart';

List<String> getEarlyQuestions() {
  return [
    "Do you forget your daily appointments?",
    "Do you repeat the same questions?",
    "Do you forget current events?",
    "Do you forget where things are?",
    "Are you having difficulty expressing what you want to say?",
  ];
}

// Late stage questions for cognitive assessment
List<String> getLateQuestions() {
  return [
    "Do you feel unable to speak at all?",
    "Do you feel unable to perform tasks?",
    "Do you have difficulty getting to know people at all?",
    "Do you have a loss of balance or feel like you fall a lot?",
    "Have you been feeling very tired lately?",
  ];
}

// Moderate stage questions for cognitive assessment
List<String> getModerateQuestions() {
  return [
    "Do you forget your family names?",
    "Do you forget personal dates and places?",
    "Do you feel disoriented or hallucinating?",
    "Have you lost your ability to interact with money?",
    "Do you forget words and replace them with inappropriate words?",
  ];
}

Color getColorBasedOnRisk(double riskPercentage) {
  if (riskPercentage >= 0 && riskPercentage <= 33) {
    return AppColors.green32; // Low risk
  } else if (riskPercentage > 33 && riskPercentage <= 66) {
    return AppColors.yellowFEC; // Moderate risk
  } else {
    return AppColors.redEF; // High risk
  }
}

String getRiskLabel(double riskPercentage) {
  if (riskPercentage >= 0 && riskPercentage <= 33) {
    return "Normal";
  } else if (riskPercentage > 33 && riskPercentage <= 66) {
    return "Moderate Risk";
  } else {
    return "High Risk";
  }
}

Widget getResultWidget(double riskPercentage) {
  if (riskPercentage >= 0 && riskPercentage <= 33) {
    return NormalResult();
  } else if (riskPercentage > 33 && riskPercentage <= 66) {
    return ModerateHighResult(isModerate: true);
  } else {
    return ModerateHighResult(isModerate: false);
  }
}
