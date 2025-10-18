import 'dart:developer';
import 'dart:io';

void main() {
  const String featureName = 'onboarding'; // Change this to your feature name
  // Project path
  final projectPath = "${Directory.current.path}/lib/features/$featureName";
  // final bool isWeb = false;

  // Folder and file structure
  final paths = [
    '$projectPath/presentation/bloc',
    '$projectPath/presentation/screens',
    '$projectPath/presentation/screens/${featureName}_screen.dart',
    '$projectPath/presentation/widgets',
    // if (isWeb) '$projectPath/presentation/widgets/web',
    // if (isWeb)
    //   '$projectPath/presentation/widgets/web/${featureName}_web_layout.dart',
    // if (isWeb) '$projectPath/presentation/widgets/shared',
    // if (isWeb) '$projectPath/presentation/widgets/mobile',
    // if (isWeb)
    //   '$projectPath/presentation/widgets/mobile/${featureName}_mobile_layout.dart',
    '$projectPath/domain/entities',
    '$projectPath/domain/repositories',
    '$projectPath/domain/repositories/${featureName}_repo.dart',
    '$projectPath/domain/usecases',
    '$projectPath/data/models',
    '$projectPath/data/repositories',
    '$projectPath/data/repositories/${featureName}_repo_impl.dart',
    '$projectPath/data/datasources',
    '$projectPath/data/datasources/local_datasources',
    '$projectPath/data/datasources/remote_datasources',
    '$projectPath/data/datasources/local_datasources/${featureName}_local_datasources.dart',
    '$projectPath/data/datasources/remote_datasources/${featureName}_remote_datasources.dart',
  ];

  for (var path in paths) {
    if (path.endsWith('.dart')) {
      // Handle files
      final file = File(path);
      if (!file.existsSync()) {
        file.createSync(recursive: true);
        log('Created file: $path ✓');
      } else {
        log('File already exists: $path');
      }
    } else {
      // Handle directories
      final directory = Directory(path);
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
        log('Created directory: $path ✓');
      } else {
        log('Directory already exists: $path');
      }
    }
  }
  log('Feature files and folders created successfully ✓');
}

// dart run lib/create_feature_folders_clean_architecture.dart
