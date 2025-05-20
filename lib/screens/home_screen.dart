import 'package:flutter/material.dart';
import '../utils/fallacy_analyzer.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  String? _errorText;

  void _analyzeThought() {
    String input = _controller.text.trim();
    if (input.isEmpty) {
      setState(() {
        _errorText = 'Please enter a thought.';
      });
      return;
    }

    final result = FallacyAnalyzer.analyze(input);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(analysisResult: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fallacy Finder'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Write your thought below:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'e.g. I always mess things up.',
                errorText: _errorText,
                border: OutlineInputBorder(),
              ),
              onChanged: (_) {
                setState(() {
                  _errorText = null;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _analyzeThought,
              child: Text('Analyze Thought'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
