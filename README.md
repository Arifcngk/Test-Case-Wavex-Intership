
# Wavex Intership Test Case

Welcome to the WaveX Rowing Workout App, a simplified rowing training application developed as part of the WaveX Internship Test Case. This Flutter-based mobile app allows users to manage and track rowing workouts with a focus on usability, responsive design, and core functionality as outlined in the provided Figma designs.

This project is a rowing workout application built with Flutter, designed to meet the requirements of the WaveX Internship Test Case. The app starts directly on the Training page and includes features for creating, managing, and saving workout plans. While the design includes a navigation bar with "Home," "History," and "Profile" tabs, this implementation focuses solely on the Training tab and its related screens.

Note: Authentication, persistent data storage (e.g., database), and non-Training screens are out of scope for this task. The goal is to showcase Flutter UI development, screen transitions, and basic interactivity.


## Features

- Training Page: Entry point with four workout options:
  - Just Row: Starts a simple rowing session with a counting-up timer.

  - Single Time: Allows users to set a countdown timer and optionally save the workout.

  - Constant Intervals: Supports repeating cycles of workout and rest times (e.g., 10 min workout, 2 min rest).

  - Variable Intervals: Enables adding multiple intervals with custom workout and rest times, reorderable via drag-and-drop.

- Row Screen: A unified workout screen with a functional timer (countdown or count-up based on the mode) and static data placeholders (e.g., Pace, SPM).

- Saved Workouts: A screen to view saved workouts with type-specific icons and colors.

- Responsive Design: Adapts to various screen sizes and orientations (portrait/landscape).

- State Management: Uses Provider for in-memory workout data handling.
## Getting Started

Follow these steps to set up and run the project locally.

Clone the Repository:
```bash
git clone https://github.com/username/test_case_wavex_intership.git
cd test_case_wavex_intership
```

Install Dependencies:

```bash
flutter pub get
```

Run the App:

```bash
flutter run
```



  
## Technologies Used

- Flutter: Cross-platform framework for Android and iOS.
- Dart: Programming language for app logic.
- Provider: Lightweight state management for workout data.
- Google Fonts: Typography consistent with Figma designs.
- ReorderableListView: Drag-and-drop functionality for Variable Intervals.
- flutter_advanced_switch: Custom toggle switch for "Save Workout" feature
  


  
