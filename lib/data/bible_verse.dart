class BibleVerse {
  final String name;
  final int chapter;
  final int verse;
  final String message;

  BibleVerse({
    required this.name,
    required this.chapter,
    required this.verse,
    required this.message,
  });

  factory BibleVerse.fromJson(Map<String, dynamic> json) {
    return BibleVerse(
      name: json['name'],
      chapter: json['chapter'],
      verse: json['verse'],
      message: json['message'],
    );
  }
}

class Bible {
  final List<BibleVerse> verses;

  Bible({required this.verses});

  factory Bible.fromJson(List<Map<String, dynamic>> json) {
    List<BibleVerse> verses =
        json.map((verseJson) => BibleVerse.fromJson(verseJson)).toList();
    return Bible(verses: verses);
  }
}
