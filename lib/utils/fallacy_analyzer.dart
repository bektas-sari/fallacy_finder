class FallacyDetail {
  final String explanation;
  final String? suggestion;

  FallacyDetail(this.explanation, [this.suggestion]);
}

class FallacyAnalyzer {
  static String normalize(String text) {
    return text
        .replaceAll('’', "'")
        .replaceAll('‘', "'")
        .replaceAll('“', '"')
        .replaceAll('”', '"');
  }

  static final Map<String, FallacyDetail> _rules = {
    // 🔹 Sample entry (senin geniş listeye göre buraya daha fazlası eklenebilir)
    'always': FallacyDetail(
      'All-or-Nothing Thinking: Using words like "always" implies extreme, black-and-white thinking.',
      'Try saying: "This happens sometimes, not always."',
    ),
    'never': FallacyDetail(
      'All-or-Nothing Thinking: "Never" suggests absolute failure or exclusion.',
      'Try saying: "There are times when things go differently."',
    ),
    'I’m stupid': FallacyDetail(
      'Labeling: You are assigning a negative identity to yourself.',
      'You could say: "I made a mistake, but I’m learning."',
    ),
    'because they hate me': FallacyDetail(
      'Mind Reading: Assuming you know what others are thinking.',
      'You might ask yourself: "Do I have clear evidence for that?"',
    ),
    // 🔹 Buraya senin önceki detaylı listedeki tüm terimleri aynı formatla ekleyebilirsin
  };

  static Map<String, FallacyDetail> analyze(String input) {
    final lowerInput = normalize(input.toLowerCase());
    Map<String, FallacyDetail> findings = {};

    _rules.forEach((key, detail) {
      final pattern = RegExp(r'\b' + RegExp.escape(key) + r'\b');
      if (pattern.hasMatch(lowerInput)) {
        findings[key] = detail;
      }
    });

    return findings;
  }
}
