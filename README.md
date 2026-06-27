# Student Grade Tracker App

A Flutter application that allows students to add subjects with marks, view grades, and see an overall performance summary. The application uses Provider for state management and supports both light and dark themes.

## Features

* Add subjects with marks using a validated form
* Automatic grade calculation (A, B, C, F)
* View all subjects in a dynamic list
* Swipe to delete subjects using Dismissible
* Live summary with:

  * Total subjects
  * Average marks
  * Overall grade
* Display passing subjects using collection filtering
* Light and dark theme support
* State management using Provider
* No usage of setState anywhere in the application

## Grade System

| Mark Range | Grade |
| ---------- | ----- |
| 80 - 100   | A     |
| 65 - 79    | B     |
| 50 - 64    | C     |
| 0 - 49     | F     |

## Technologies Used

* Flutter
* Dart
* Provider
* Material 3

## Project Structure

```text
lib/
├── main.dart
├── models/
│   └── subject.dart
├── providers/
│   ├── navigation_provider.dart
│   ├── subject_provider.dart
│   └── theme_provider.dart
├── screens/
│   ├── add_subject_screen.dart
│   ├── subject_list_screen.dart
│   └── summary_screen.dart
├── themes/
│   └── app_theme.dart
└── widgets/
    └── main_navigation.dart
```

## Assignment Requirements Covered

* Subject class with private `_mark` field
* Grade getter implementation
* Collection methods (`where()` and `map()`) usage
* Form validation for subject name and marks
* ListView.builder implementation
* Dismissible delete functionality
* Live-updating summary screen
* Custom light and dark themes
* Theme colors accessed through `Theme.of(context)`
* Provider-based state management
* Zero `setState()` calls

## How to Run

Clone the repository:

```bash
git clone <repository-url>
```

Navigate to the project folder:

```bash
cd student_grade_tracker
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Sample Commit History

```text
feat: create subject model and provider

feat: implement add subject and list screens

feat: add summary page and theme switching

fix: improve form validation and delete functionality

docs: add project README
```

## Author

Md Noushad
