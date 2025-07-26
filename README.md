# 📱 News Flow

News Flow is a Flutter-based mobile application that delivers the latest news in a clean, scrollable interface. Each article displays an image, headline, and brief description — with a "Read More" button that opens the full article using a built-in WebView.

---

## 🚀 Features

- 📰 Displays real-time news articles
- 🖼️ Shows headlines, images, and descriptions
- 🌐 Open full articles in-app using WebView
- 📱 Works smoothly on Android and iOS
- ⚙️ Simple and modern UI

---

## 🛠️ Tech Stack

- **Flutter** – UI toolkit for building cross-platform apps
- **Dart** – Programming language used by Flutter
- [`http`](https://pub.dev/packages/http) – For API calls
- [`webview_flutter`](https://pub.dev/packages/webview_flutter) – To render full news pages

---

## 📦 Getting Started

Follow these steps to run the app locally:

### 1. Clone the Repository

```bash
git clone https://github.com/Msaqib295/News_Flow_FlutterApp.git
cd News_Flow_FlutterApp
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```

> Make sure you have Flutter SDK installed and an emulator/device connected.

---

## 🧪 Build APK (Android)

To generate a release APK:

```bash
flutter build apk --release
```

You’ll find the APK here:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 📂 Folder Structure (Simplified)

```
lib/
├── main.dart            # Entry point
├── news_container.dart  # Widget for displaying news articles
└── news_webview.dart    # WebView screen for full news article
```

---

## 🤝 Contributing

Got suggestions or improvements? Open a pull request or file an issue! All kinds of contributions are welcome and appreciated.

---

## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for more info.

---

## 👤 Author

**Saqib Yasir**  
📍 [GitHub @Msaqib295](https://github.com/Msaqib295)

---

Thanks for checking out **News Flow**! 🚀
