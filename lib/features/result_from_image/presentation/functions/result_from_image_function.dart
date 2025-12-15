import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';

List<String> getTitleNormalPrediction() {
  return [
    "Eat for Brain Health",
    "Limit Distractions",
    "Keep Your Mind Engaged",
  ];
}

List<String> getSubTitleNormalPrediction() {
  return [
    "Eat omega-3 rich foods and maintain regular sleep and hydration.",
    "Focus on one task at a time to strengthen attention span.",
    "Try puzzles, reading, or memory games every day to keep your brain active.",
  ];
}

List<String> getTitleModeratePrediction() {
  return [
    "Create a Calm Environment",
    "Protect Your Routine",
    "Follow Treatment Plans",
  ];
}

List<String> getSubTitleModeratePrediction() {
  return [
    "Talk to friends or family regularly, social interaction boosts memory",
    "Keep a consistent sleep and meal schedule to stabilize your focus.",
    "Take prescribed medications and attend all medical checkups.",
  ];
}

List<String> getIconModeratePrediction() {
  return [
    AppIcons.coreCommonAssetsIconsModerateIconsResultImage1,
    AppIcons.coreCommonAssetsIconsModerateIconsResultImage2,
    AppIcons.coreCommonAssetsIconsModerateIconsResultImage3,
  ];
}

List<String> getIconNormalPrediction() {
  return [
    AppIcons.coreCommonAssetsIconsNormalIconsResultImage1,
    AppIcons.coreCommonAssetsIconsNormalIconsResultImage2,
    AppIcons.coreCommonAssetsIconsNormalIconsResultImage3,
  ];
}

String getTitleSeverePrediction(String prediction, int index) {
  if (prediction == noImpairment) {
    return getTitleNormalPrediction()[index];
  } else {
    return getTitleModeratePrediction()[index];
  }
}

String getSubTitleSeverePrediction(String prediction, int index) {
  if (prediction == noImpairment) {
    return getSubTitleNormalPrediction()[index];
  } else {
    return getSubTitleModeratePrediction()[index];
  }
}

String getIconSeverePrediction(String prediction, int index) {
  if (prediction == "No Impairment") {
    return getIconNormalPrediction()[index];
  } else {
    return getIconModeratePrediction()[index];
  }
}

String getTitleForPrediction(String prediction) {
  if (prediction == noImpairment) {
    return "Normal";
  } else if (prediction == moderateImpairment ||
      prediction == "Mild Impairment") {
    return "Moderate Risk";
  } else if (prediction == "Out of scope") {
    return prediction;
  } else {
    return "High Risk";
  }
}

String noImpairment = "No Impairment";
String moderateImpairment = "Moderate Impairment";
String outOfScope = "Out of scope";
Color getTileColor(String prediction) {
  if (prediction == noImpairment) {
    return AppColors.green32;
  } else if (prediction == moderateImpairment ||
      prediction == "Mild Impairment") {
    return AppColors.yellowFEC;
  } else {
    return AppColors.redF3;
  }
}

String getDescriptionForPrediction(String prediction) {
  if (prediction == noImpairment) {
    return "Your brain scan looks healthy, No concerning changes detected.";
  } else if (prediction == "Moderate Impairment") {
    return "Your brain scan looks healthy, No concerning changes detected.";
  } else if (prediction == "Out of scope") {
    return "The uploaded image is out of the model's scope. Please try with a different image.";
  } else {
    return "Your brain scan looks healthy, No concerning changes detected.";
  }
}
