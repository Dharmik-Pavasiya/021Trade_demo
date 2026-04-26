# Watchlist Management App

A Flutter application demonstrating a stock watchlist with drag-and-drop reordering functionality, built using **Clean Architecture** and the **BLoC pattern**.

## 🛠 Tech Stack
- **Flutter Version:** 3.41.7
- **State Management:** BLoC

## 🎯 Assignment Overview
The goal of this project was to implement a watchlist management system that allows users to:
1. View a list of stocks data.
2. Enter an "Edit Mode" to manage the watchlist.
3. Reorder stocks using drag-and-drop.
4. Delete stocks from the list.
5. Persist the updated order in memory.

## 🏗 Architecture
The project follows **Clean Architecture** principles to ensure separation of concerns and maintainability:

- **Domain Layer:** Contains Business Entities (`Stock`) and Repository Interfaces. This layer is independent of any other layer.
- **Data Layer:** Implements the Repository Interfaces (`WatchlistRepositoryImpl`) and handles data sources (in-memory storage in this case).
- **Presentation Layer:** Contains the UI logic (BLoC) and Widgets. It depends only on the Domain layer for business logic.

## 📁 Project Structure
```
lib/
├── core/               # App-wide constants, theme, and utilities
├── features/
│   └── watchlist/
│       ├── data/       # Repository implementations and models
│       ├── domain/     # Entities and repository interfaces
│       └── presentation/
│           ├── bloc/   # Watchlist BLoC (Events & States)
│           ├── screens/ # Main and Edit screens
│           └── widgets/ # Reusable UI components (Stock items)
└── main.dart           # App entry point and dependency injection
```

## 🧠 BLoC Flow
The application state is managed by `WatchlistBloc`:
1. **LoadWatchlist:** Triggered on app start to fetch initial data.
2. **ToggleEditMode:** Switches the UI between viewing and editing states.
3. **ReorderWatchlist:** Handles the logic for moving items within the list.
4. **RemoveStock:** Handles deletion of an item during edit mode.
5. **SaveWatchlist:** Persists the current list state back to the repository.

## 🔄 Reordering Logic
Reordering is implemented using Flutter's `ReorderableListView`. When a user drags an item, the BLoC calculates the new index with a correction for upward movement:
```dart
if (newIndex > oldIndex) newIndex--;
```
The list is then updated immutably using the `copyWith` pattern, ensuring the UI stays in sync with the state.

## 🚀 Getting Started
1. Ensure you have Flutter 3.41.7 or higher installed.
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Run the app using `flutter run`.
