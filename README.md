# task_management

Task Manager App
A simple and elegant task management application built with Flutter that allows users to create, manage, and track their daily tasks with persistent data storage.
Features

Add Tasks: Create new tasks with title and description
Mark Complete: Toggle task completion status with checkboxes
Delete Tasks: Remove tasks with confirmation dialog
Data Persistence: Tasks are saved locally using SharedPreferences
Progress Tracking: Visual progress indicator showing completed vs total tasks
Responsive UI: Clean, modern interface with Material Design
Empty State: Helpful guidance when no tasks exist

## Getting Started

Project Structure
lib/
├── main.dart                 # App entry point
├── models/
│   └── task.dart            # Task data model
├── services/
│   └── task_service.dart    # Data persistence service
├── screens/
│   └── home_screen.dart     # Main screen
└── widgets/
    ├── task_item.dart       # Individual task widget
    └── add_task_dialog.dart  # Add task dialog
Dependencies

flutter: SDK framework
shared_preferences: Local data persistence
cupertino_icons: iOS-style icons

Key Features Implementation
Data Persistence
Uses SharedPreferences to store tasks locally in JSON format, ensuring data survives app restarts.
State Management
Implements StatefulWidget with proper state management for real-time UI updates.
Form Validation
Includes input validation for task creation with user-friendly error messages.
Material Design
Follows Material Design principles with consistent theming and responsive layouts.
Testing and Debugging
The app includes comprehensive error handling and user feedback:

Try/catch blocks for all data operations
Loading states during data fetch
Success/error snackbar notifications
Form validation with helpful error messages

Debug Mode
Run in debug mode to access Flutter's debugging tools:
bashflutter run --debug
Common Issues and Solutions

SharedPreferences not working: Ensure proper async/await usage
UI not updating: Check setState() calls after data operations
Build errors: Run flutter clean and flutter pub get
