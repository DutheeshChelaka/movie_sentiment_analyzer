class SentimentService {
  // Simple rule-based sentiment analysis (Phase 1)
  // We'll upgrade to real AI model later
  
  Map<String, String> analyzeSentiment(String text) {
    final lowerText = text.toLowerCase();
    
    // Positive keywords
    final positiveWords = [
      'amazing', 'excellent', 'great', 'wonderful', 'fantastic', 
      'brilliant', 'superb', 'outstanding', 'perfect', 'love',
      'best', 'awesome', 'good', 'beautiful', 'masterpiece'
    ];
    
    // Negative keywords
    final negativeWords = [
      'bad', 'terrible', 'awful', 'horrible', 'worst', 
      'poor', 'disappointing', 'boring', 'waste', 'hate',
      'disgusting', 'pathetic', 'stupid', 'trash', 'garbage'
    ];
    
    int positiveCount = 0;
    int negativeCount = 0;
    
    for (var word in positiveWords) {
      if (lowerText.contains(word)) {
        positiveCount++;
      }
    }
    
    for (var word in negativeWords) {
      if (lowerText.contains(word)) {
        negativeCount++;
      }
    }
    
    if (positiveCount > negativeCount) {
      double confidence = (positiveCount / (positiveCount + negativeCount + 1)) * 100;
      return {
        'label': 'Positive 😊',
        'confidence': '${confidence.toStringAsFixed(1)}%',
      };
    } else if (negativeCount > positiveCount) {
      double confidence = (negativeCount / (positiveCount + negativeCount + 1)) * 100;
      return {
        'label': 'Negative 😞',
        'confidence': '${confidence.toStringAsFixed(1)}%',
      };
    } else {
      return {
        'label': 'Neutral 😐',
        'confidence': '50.0%',
      };
    }
  }
}
