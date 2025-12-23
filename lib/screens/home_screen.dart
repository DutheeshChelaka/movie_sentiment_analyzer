import 'package:flutter/material.dart';
import '../services/sentiment_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _reviewController = TextEditingController();
  final SentimentService _sentimentService = SentimentService();
  String _result = '';
  bool _isAnalyzing = false;
  List<Map<String, dynamic>> _history = [];

  void _analyzeSentiment() async {
    if (_reviewController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a review!')),
      );
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _result = '';
    });

    await Future.delayed(const Duration(seconds: 1)); // Simulate API call

    final sentiment = _sentimentService.analyzeSentiment(_reviewController.text);
    
    setState(() {
      _result = sentiment['label']!;
      _isAnalyzing = false;
      _history.insert(0, {
        'review': _reviewController.text,
        'sentiment': sentiment['label'],
        'confidence': sentiment['confidence'],
        'time': DateTime.now(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎬 Movie Sentiment Analyzer'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter Movie Review',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _reviewController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'e.g., This movie was absolutely amazing! The acting was superb...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isAnalyzing ? null : _analyzeSentiment,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: _isAnalyzing
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                'Analyze Sentiment',
                                style: TextStyle(fontSize: 16),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Result Card
            if (_result.isNotEmpty) ...[
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                color: _result == 'Positive 😊' ? Colors.green[50] : Colors.red[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        _result,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: _result == 'Positive 😊' ? Colors.green : Colors.red,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Confidence: ${_history[0]['confidence']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            // History
            if (_history.isNotEmpty) ...[
              const SizedBox(height: 30),
              const Text(
                'Analysis History',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _history.length > 5 ? 5 : _history.length,
                itemBuilder: (context, index) {
                  final item = _history[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: item['sentiment'] == 'Positive 😊'
                            ? Colors.green
                            : Colors.red,
                        child: Text(
                          item['sentiment'] == 'Positive 😊' ? '😊' : '😞',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      title: Text(
                        item['review'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(item['confidence']),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
