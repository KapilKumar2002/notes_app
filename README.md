# 📝 Flutter Notes App

A clean, scalable, and animated Notes app built using **Flutter** and following **Clean Architecture**, **Hive for local storage**, **Riverpod for state management**, and custom **Theming with Light/Dark mode**.

---

## 🚀 Features

- 🧱 Clean Architecture (Data, Domain, Presentation)
- 🎨 Custom Theming (Light & Dark Mode)
- 🧠 Riverpod for state management
- 📂 Hive for fast and persistent local storage
- ✍️ Add, Edit, and Delete Notes
- 📦 Global color and typography management
- ✨ Smooth splash screen animation
- 🔁 Theme toggle with state persistence (optional)

---

## 🧹 Tech Stack

| Layer           | Tech Used                         |
|----------------|------------------------------------|
| UI & State      | Flutter + Riverpod                |
| Local Database  | Hive                              |
| Architecture    | Clean Architecture (SOLID, DRY)   |
| Fonts           | Google Fonts (Poppins)            |
| Theme           | Material 3 + ThemeData            |

---

## 📁 Folder Structure

```
lib/
🔼️ core/                # Global constants and helpers
🔼️ data/
🔼️🔼️ models/          # Hive models (NoteModel)
🔼️🔼️ sources/         # Local data (Hive) interactions
🔼️🔼️ repositories/    # Repository implementations
🔼️ domain/
🔼️🔼️ entities/        # Business models (Note)
🔼️🔼️ repositories/    # Abstract repo contracts
🔼️🔼️ usecases/        # Add, Delete, Update, GetAll use cases
🔼️ presentation/
🔼️🔼️ providers/       # Riverpod StateNotifiers
🔼️🔼️ screens/         # UI Screens (Home, Add/Edit, Splash)
🔼️🔼️ widgets/         # Reusable UI widgets
🔼️ theme/               # AppTheme, AppColors, TextTheme, ThemeProvider
🔼️ main.dart            # Entry point with ProviderScope
```

---

## 💡 Architectural Pattern

This app follows **Clean Architecture**:
- **Domain Layer** knows nothing about Flutter or Hive
- **Data Layer** handles Hive and implements abstract contracts
- **Presentation Layer** uses `Riverpod` for clean, reactive state management

---



## 🛠️ Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/KapilKumar2002/notes_app.git
cd flutter-notes-app
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Generate Hive Adapters
```bash
flutter pub run build_runner build
```

### 4. Run the app
```bash
flutter run
```

---



## 🧑‍💻 Author

**Kapil Kumar** – [@Kapil Kumar](https://github.com/KapilKumar2002)

---


