import 'package:flutter/material.dart';
import '../utils/fallacy_analyzer.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, FallacyDetail> analysisResult;

  const ResultScreen({super.key, required this.analysisResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis Result'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: analysisResult.isEmpty
            ? Center(
          child: Text(
            'No thinking errors detected.\nGreat job!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detected thinking errors:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: analysisResult.length,
                itemBuilder: (context, index) {
                  final key = analysisResult.keys.elementAt(index);
                  final detail = analysisResult[key]!;

                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        '"$key"',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detail.explanation,
                            style: TextStyle(fontSize: 16),
                          ),
                          if (detail.suggestion != null) ...[
                            SizedBox(height: 8),
                            Text(
                              '💡 Suggestion: ${detail.suggestion}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
