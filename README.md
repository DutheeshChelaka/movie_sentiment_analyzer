# 🎬 Movie Sentiment Analyzer

An AI-powered Flutter application that analyzes movie reviews and determines whether they are positive or negative.

## 🚀 Features

- **Sentiment Analysis**: Automatically detects positive/negative sentiment in movie reviews
- **Confidence Score**: Shows the confidence percentage of the analysis
- **History Tracking**: Keeps track of all analyzed reviews
- **Beautiful UI**: Clean and modern user interface
- **Cross-Platform**: Works on Web, iOS, Android, macOS, Linux, and Windows

## 🛠️ Tech Stack

- **Framework**: Flutter 3.38.5
- **Language**: Dart
- **AI/ML**: Rule-based sentiment analysis (v1.0)
- **Platforms**: Web, iOS, Android, Desktop

## 🎯 How It Works

The app uses a keyword-based sentiment analysis algorithm that:
1. Analyzes the text for positive keywords (amazing, excellent, great, etc.)
2. Analyzes the text for negative keywords (terrible, awful, bad, etc.)
3. Calculates a confidence score based on keyword frequency
4. Returns the sentiment with confidence percentage

## 📦 Installation

### Prerequisites
- Flutter SDK (3.38.5 or higher)
- Dart SDK
- Chrome (for web development)

### Setup

1. Clone the repository:
```bash
git clone https://github.com/DutheeshChelaka/movie_sentiment_analyzer.git
cd movie_sentiment_analyzer
```

2. Get dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run -d chrome
```

## 🗂️ Project Structure
```
lib/
├── main.dart                 # App entry point
├── screens/
│   └── home_screen.dart     # Main UI screen
├── services/
│   └── sentiment_service.dart # Sentiment analysis logic
├── models/                   # Data models (coming soon)
└── widgets/                  # Reusable widgets (coming soon)
```

## 🔮 Future Enhancements

- [ ] Integrate real ML model (TensorFlow Lite / Hugging Face)
- [ ] Add data visualization (charts/graphs)
- [ ] Export analysis results
- [ ] Multi-language support
- [ ] User authentication
- [ ] Save reviews to cloud database
- [ ] Mobile app optimization

## 📈 Development Progress

- [x] Initial project setup
- [x] Basic UI implementation
- [x] Rule-based sentiment analysis
- [x] History tracking feature
- [ ] Real AI model integration
- [ ] Database integration
- [ ] User authentication

## 👨‍💻 Author

**Dutheesh Chelaka**
- GitHub: [@DutheeshChelaka](https://github.com/DutheeshChelaka)
- Email: dutheeshwork@gmail.com

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## ⭐ Show your support

Give a ⭐️ if you like this project!

---

**Note**: This is my first AI project as part of my AI Engineering learning journey! 🚀
