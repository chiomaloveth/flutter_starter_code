# Nova Mobile

Niigma

# Running the app

## Dev

flutter run --flavor dev -t lib/main.dart

## Prod

flutter run --flavor prod -t lib/main.dart

# Build APK on terminal

flutter build apk --flavor prod -t lib/main.dart
flutter build apk --flavor dev -t lib/main_dev.dart

<!-- https://console.firebase.google.com/u/0/project/niigma-dev/appdistribution/app/android:com.niigma.app.dev/releases -->

## Localization Code Generation

For development, you can use `dart run slang`. This is faster to see your changes.
Using the code generation with build_runner as shown below also works.

## Code Generation

1. With FVM: `fvm dart run build_runner build -d`
2. Without FVM: `dart run build_runner build -d`

## Design System

1. Error boundary is at the service implementation. All errors are converted to Failure instances with an error code.
2. Abstract classes are used to define the service interfaces under domain/services.
3. Service implementations are defined in the service folder under data/services.
4. We use BloC for state management. Each feature has its own bloc, event, and state classes.
5. We use the freezed package to generate immutable classes. You can also use Equatable when inheritance is needed.
6. Before doing a pull request, make sure to run the following commands:
   - `dart run build_runner build -d`
   - `dart format .`
   - `flutter analyze`
   - `flutter test`
7. Before implementing anything, ask yourself how easy it is to adapt it to the web and how easy it is to extract it to another project. Essentially, think about the design system and create abstractions to make it portable.

## Spell checking

Install Code Spell Checker (search for: streetsidesoftware.code-spell-checker) extension on VS code
Quick tutorial on CSpell https://www.youtube.com/watch?v=Ix5bMd0kZeY

# Setup Flutter & Firebase with Multiple Flavors

//https://codewithandrea.com/articles/flutter-firebase-multiple-flavors-flutterfire-cli/

<!-- # format project to use 120 character per line of code
fvm dart format --set-exit-if-changed . -l 120
dart format --set-exit-if-changed . -l 120 -->
